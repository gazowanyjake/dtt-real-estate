import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dtt/home_bloc/interface/home_interface.dart';
import 'package:dtt/model/home_model.dart';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class HomeService implements IHomeService {
  @override
  Future<Either<Exception, List<HomeModel>>> getHomes(
      LatLng userPosition) async {
    try {
      final response = await http.get(
        Uri.parse('https://intern.d-tt.nl/api/house'),
        headers: {
          'Access-Key': '98bww4ezuzfePCYFxJEWyszbUXc7dxRx',
        },
      );
      final List<dynamic> jsonList = jsonDecode(response.body);

      final list = jsonList
          .map((json) => HomeModel.fromJson(json, userPosition))
          .toList();
      list.sort((a,b) => a.price.compareTo(b.price));
      return right(list);
    } catch (error) {
      print('getHomes error: $error');
      return left(Exception());
    }
  }

  @override
  Future<Either<Exception, LatLng>> getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return left(Exception());
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return left(Exception());
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return left(Exception());
    }
    Position userPosition = await Geolocator.getCurrentPosition();

    return right(
      LatLng(
        userPosition.latitude,
        userPosition.longitude,
      ),
    );
  }
}
