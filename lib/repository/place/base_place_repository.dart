import 'package:food_delivery_app/model/place/place_autocomplete_model.dart';

import '../../model/place/place_model.dart';

abstract class BasePlacesRepository {
  Future<List<PlaceAutocomplete>?> getAutocomplete(String searchInput) async {}
  Future<Place?> getPlaces(String placeId) async {}
}
