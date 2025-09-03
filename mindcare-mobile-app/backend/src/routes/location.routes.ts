import express from 'express';

const router = express.Router();

// Mock location routes for demo
router.post('/current', async (req, res) => {
  try {
    const { latitude, longitude } = req.body;
    
    // Mock location update
    const locationData = {
      userId: '1',
      latitude: latitude || 37.7749,
      longitude: longitude || -122.4194,
      timestamp: new Date().toISOString(),
      accuracy: 10
    };
    
    res.json({
      success: true,
      data: locationData,
      message: 'Location updated successfully'
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Failed to update location'
    });
  }
});

router.post('/geocode', async (req, res) => {
  try {
    const { address } = req.body;
    
    // Mock geocoding
    const geocodeResult = {
      address: address || 'San Francisco, CA',
      latitude: 37.7749,
      longitude: -122.4194,
      formatted_address: 'San Francisco, CA, USA'
    };
    
    res.json({
      success: true,
      data: geocodeResult
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Geocoding failed'
    });
  }
});

router.post('/reverse', async (req, res) => {
  try {
    const { latitude, longitude } = req.body;
    
    // Mock reverse geocoding
    const reverseResult = {
      latitude: latitude || 37.7749,
      longitude: longitude || -122.4194,
      address: 'San Francisco, CA, USA',
      city: 'San Francisco',
      state: 'California',
      country: 'United States'
    };
    
    res.json({
      success: true,
      data: reverseResult
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Reverse geocoding failed'
    });
  }
});

router.get('/places', async (req, res) => {
  try {
    const { type, latitude, longitude, radius } = req.query;
    
    // Mock nearby places
    const mockPlaces = [
      {
        id: 'place1',
        name: 'San Francisco General Hospital',
        type: 'hospital',
        distance: 0.5,
        address: '1001 Potrero Ave, San Francisco, CA',
        rating: 4.2,
        phone: '(415) 206-8000'
      },
      {
        id: 'place2',
        name: 'Mental Health Center SF',
        type: 'mental_health',
        distance: 0.8,
        address: '123 Mental Health St, San Francisco, CA',
        rating: 4.5,
        phone: '(415) 123-4567'
      }
    ];
    
    res.json({
      success: true,
      data: mockPlaces
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      error: 'Failed to fetch places'
    });
  }
});

export default router;