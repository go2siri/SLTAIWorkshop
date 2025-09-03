import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../domain/entities/location_entity.dart';

abstract class LocationDataSource {
  Future<LocationEntity> getCurrentLocation();
  Future<List<Placemark>> getAddressFromCoordinates(double latitude, double longitude);
  Future<List<Location>> getCoordinatesFromAddress(String address);
  Future<bool> requestLocationPermission();
  Future<bool> isLocationServiceEnabled();
}

class LocationDataSourceImpl implements LocationDataSource {
  @override
  Future<LocationEntity> getCurrentLocation() async {
    try {
      final hasPermission = await requestLocationPermission();
      if (!hasPermission) {
        throw Exception('Location permission denied');
      }

      final serviceEnabled = await isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled');
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      );

      return LocationEntity(
        latitude: position.latitude,
        longitude: position.longitude,
        accuracy: position.accuracy,
        timestamp: position.timestamp ?? DateTime.now(),
      );
    } catch (e) {
      throw Exception('Failed to get current location: ${e.toString()}');
    }
  }

  @override
  Future<List<Placemark>> getAddressFromCoordinates(double latitude, double longitude) async {
    try {
      final placemarks = await placemarkFromCoordinates(latitude, longitude);
      return placemarks;
    } catch (e) {
      throw Exception('Failed to get address from coordinates: ${e.toString()}');
    }
  }

  @override
  Future<List<Location>> getCoordinatesFromAddress(String address) async {
    try {
      final locations = await locationFromAddress(address);
      return locations;
    } catch (e) {
      throw Exception('Failed to get coordinates from address: ${e.toString()}');
    }
  }

  @override
  Future<bool> requestLocationPermission() async {
    try {
      final status = await Permission.location.request();
      return status == PermissionStatus.granted;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> isLocationServiceEnabled() async {
    try {
      return await Geolocator.isLocationServiceEnabled();
    } catch (e) {
      return false;
    }
  }
}