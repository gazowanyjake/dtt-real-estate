import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:dtt/model/home_model.dart';


abstract class IHomeService {
  Future<Either<Exception, List<HomeModel>>> getHomes(LatLng userPosition);
  Future<Either<Exception, LatLng>> getLocation();
}
