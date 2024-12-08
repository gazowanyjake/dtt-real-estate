
import 'package:latlong2/latlong.dart';

class HomeModel {
  final int id;
  final String image;
  final int price;
  final int bedrooms;
  final int bathrooms;
  final int size;
  final String description;
  final String zip;
  final String city;
  final double latitude;
  final double longitude;
  final DateTime createdDate;
  double? distance;

  HomeModel({
    required this.id,
    required this.image,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.size,
    required this.description,
    required this.zip,
    required this.city,
    required this.latitude,
    required this.longitude,
    required this.createdDate,
    this.distance,
  });

  factory HomeModel.fromJson(
    Map<String, dynamic> json,
    LatLng userPosition,
  ) {
    final Distance distance = Distance();

    return HomeModel(
      id: json['id'],
      image: 'https://intern.d-tt.nl${json['image']}' ,
      price: json['price'],
      bedrooms: json['bedrooms'],
      bathrooms: json['bathrooms'],
      size: json['size'],
      description: json['description'],
      zip: json['zip'],
      city: json['city'],
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      createdDate: DateTime.parse(json['createdDate']),
      distance: distance.as(
        LengthUnit.Kilometer,
        userPosition,
        LatLng(
          (json['latitude'] as num).toDouble(),
          (json['longitude'] as num).toDouble(),
        ),
      ),
    );
  }
}
