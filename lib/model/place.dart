import 'package:google_maps_flutter/google_maps_flutter.dart';

class Place {

  String desc;

  String location;

  String Id;

  DateTime start;

  LatLng? position;

  Place({
    required this.desc,
    required this.location,
    required this.Id,
    required this.start,
    this.position
  });
}