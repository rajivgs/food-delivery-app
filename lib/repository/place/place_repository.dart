import 'package:food_delivery_app/model/place_autocomplete_model.dart';
import 'package:food_delivery_app/repository/place/base_place_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlacesRepository extends BasePlacesRepository {
  final String key = 'AIzaSyC5_gbjS9NWtlTZPvNo2Ocf9CqAfl494V4';
  final String types = 'geocode';

  @override
  Future<List<PlaceAutoComplete>?> getAutoComplete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceAutoComplete.fromJson(place)).toList();
  }
}
