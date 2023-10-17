import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/services.dart';

class LocationAndAddressState extends State<LocationAndAddress> {
  Position? _currentPosition;
  String? _currentAddress;
  DateTime? _lastUpdatedTime;
  bool _isLoading = false;
  bool showCity = true;
  bool showState = true;
  bool showCountry = true;
  List<String> addressHistory = [];

  Future<bool> _handlePermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Enable Location Service in device settings."),
      ));
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Location Permission Denied!"),
        ));
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Location Permission Denied! Go to your app settings."),
      ));
      return false;
    }

    return true;
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoading = true;
    });

    final bool hasPermission = await _handlePermission();
    if (!hasPermission) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
        _lastUpdatedTime = DateTime.now();
        _isLoading = false;
      });

      getAddressFromCoordinates(_currentPosition!);
    } catch (e) {
      debugPrint(e.toString());
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }

  Future<void> getAddressFromCoordinates(Position position) async {
    try {
      final List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      final Placemark place = placemarks[0];
      final address = getAddressString(place);
      setState(() {
        _currentAddress = address;
        addressHistory.insert(0, address);
      });
    } catch (e) {
      debugPrint(e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: $e'),
        ),
      );
    }
  }

  String getAddressString(Placemark place) {
    String address = '';
    if (showCity) {
      address += '${place.locality}, ';
    }
    if (showState) {
      address += '${place.administrativeArea}, ';
    }
    if (showCountry) {
      address += place.country!;
    }
    return address;
  }

  void clearAddressHistory() {
    setState(() {
      addressHistory.clear();
    });
  }

  void shareAddress() {
    if (_currentAddress != null) {
      final String address = _currentAddress!;
      Clipboard.setData(ClipboardData(text: address));
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Address Copied Successfully!"),
        ),
      );
    }
  }
}
