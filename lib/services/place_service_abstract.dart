import 'package:lab3_mis/model/place.dart';

abstract class PlaceService {

  void add(Place place);

  void remove(Place place);

  List<Place> getPlaces();
}