import 'dart:async';

import 'package:lab3_mis/model/exam_item.dart';
import 'package:lab3_mis/model/place.dart';
import 'package:lab3_mis/services/place_service_impl.dart';
import 'package:lab3_mis/location/geo_position.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Mapa extends StatefulWidget {

  @override
  State<Mapa> createState() => MapState();
  static const routeName = '/map';
}

class MapState extends State<Mapa> {
  final PlaceServiceImpl _placeServiceImpl = PlaceServiceImpl();
  List<Place> places = [];

  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> _markers = {};

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(24.35753120580624, -322.182743422953),
    zoom: 12.3562,
  );

  CameraPosition? _currentLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    setState(() {
      places = _placeServiceImpl.getPlaces();
      _markers = places
          .where((place) => place.position != null)
          .map((place) => Marker(
        markerId: MarkerId(place.desc.hashCode.toString()),
        position: place.position!,
        infoWindow: InfoWindow(title: place.desc),
      )).toSet();
    });
    determinePosition()
        .then((position) => setState(() => {
      _currentLocation = CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 15),
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GoogleMap(
          markers: _markers,
          mapType: MapType.terrain,
          initialCameraPosition: _currentLocation!,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        )
    );
  }
}