import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class MyLocation {
  late double latitude2;
  late double longitude2;

  Future<void> getMyCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude2 = position.latitude;
      longitude2 = position.longitude;
      debugPrint('position called');
      debugPrint(latitude2.toString());
      debugPrint(longitude2.toString());
    } catch (e) {
      debugPrint('인터넷 연결에 문제가 발생했습니다.');
    }
  }
}
