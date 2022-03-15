import 'package:lab3_mis/data/inMemory.dart';
import 'package:lab3_mis/model/place.dart';
import 'package:lab3_mis/services/place_service_abstract.dart';

class PlaceServiceImpl extends PlaceService {

  static final PlaceServiceImpl _instance = PlaceServiceImpl._intrenal();

  factory PlaceServiceImpl() => _instance;

  PlaceServiceImpl._intrenal();

  InMemory<Place> places = InMemory<Place>();
  @override
  void add(Place place) {
    places.add(place);
  }

  @override
  List<Place> getPlaces() {
    return places.getItems();
  }

  @override
  void remove(Place place) {
    places.remove(place);
  }
}