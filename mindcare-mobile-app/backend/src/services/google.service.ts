import { google } from 'googleapis';
import { OAuth2Client } from 'google-auth-library';

class GoogleService {
  private oauth2Client: OAuth2Client;
  private mapsClient: any;

  constructor() {
    this.oauth2Client = new google.auth.OAuth2(
      process.env.GOOGLE_CLIENT_ID,
      process.env.GOOGLE_CLIENT_SECRET,
      process.env.GOOGLE_REDIRECT_URI
    );

    this.mapsClient = google.maps({
      version: 'v1',
      auth: process.env.GOOGLE_MAPS_API_KEY
    });
  }

  async verifyGoogleToken(token: string) {
    try {
      const ticket = await this.oauth2Client.verifyIdToken({
        idToken: token,
        audience: process.env.GOOGLE_CLIENT_ID
      });
      
      const payload = ticket.getPayload();
      return {
        userId: payload?.sub,
        email: payload?.email,
        name: payload?.name,
        picture: payload?.picture
      };
    } catch (error) {
      throw new Error('Invalid Google token');
    }
  }

  async geocodeAddress(address: string) {
    try {
      const response = await fetch(
        `https://maps.googleapis.com/maps/api/geocode/json?address=${encodeURIComponent(address)}&key=${process.env.GOOGLE_MAPS_API_KEY}`
      );
      
      const data = await response.json();
      
      if (data.status === 'OK' && data.results.length > 0) {
        const location = data.results[0].geometry.location;
        return {
          latitude: location.lat,
          longitude: location.lng,
          formatted_address: data.results[0].formatted_address
        };
      }
      
      throw new Error('Address not found');
    } catch (error) {
      throw new Error('Geocoding failed');
    }
  }

  async reverseGeocode(latitude: number, longitude: number) {
    try {
      const response = await fetch(
        `https://maps.googleapis.com/maps/api/geocode/json?latlng=${latitude},${longitude}&key=${process.env.GOOGLE_MAPS_API_KEY}`
      );
      
      const data = await response.json();
      
      if (data.status === 'OK' && data.results.length > 0) {
        return {
          address: data.results[0].formatted_address,
          components: data.results[0].address_components
        };
      }
      
      throw new Error('Location not found');
    } catch (error) {
      throw new Error('Reverse geocoding failed');
    }
  }

  async getPlacesNearby(latitude: number, longitude: number, radius: number = 1500, type?: string) {
    try {
      let url = `https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${latitude},${longitude}&radius=${radius}&key=${process.env.GOOGLE_MAPS_API_KEY}`;
      
      if (type) {
        url += `&type=${type}`;
      }
      
      const response = await fetch(url);
      const data = await response.json();
      
      if (data.status === 'OK') {
        return data.results.map((place: any) => ({
          place_id: place.place_id,
          name: place.name,
          rating: place.rating,
          vicinity: place.vicinity,
          location: place.geometry.location,
          types: place.types,
          photos: place.photos?.map((photo: any) => 
            `https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=${photo.photo_reference}&key=${process.env.GOOGLE_MAPS_API_KEY}`
          )
        }));
      }
      
      return [];
    } catch (error) {
      throw new Error('Places search failed');
    }
  }

  async getDirections(origin: string, destination: string, mode: string = 'driving') {
    try {
      const response = await fetch(
        `https://maps.googleapis.com/maps/api/directions/json?origin=${encodeURIComponent(origin)}&destination=${encodeURIComponent(destination)}&mode=${mode}&key=${process.env.GOOGLE_MAPS_API_KEY}`
      );
      
      const data = await response.json();
      
      if (data.status === 'OK' && data.routes.length > 0) {
        const route = data.routes[0];
        return {
          distance: route.legs[0].distance,
          duration: route.legs[0].duration,
          steps: route.legs[0].steps,
          polyline: route.overview_polyline.points
        };
      }
      
      throw new Error('No routes found');
    } catch (error) {
      throw new Error('Directions request failed');
    }
  }
}

export default new GoogleService();