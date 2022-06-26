import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/repository/place/place_repository.dart';

import '../../model/place/place_model.dart';

part 'place_event.dart';
part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlacesRepository? _placesRepository;
  StreamSubscription? _placeSubscription;

  PlaceBloc({
    required PlacesRepository placesRepository,
  })  : _placesRepository = placesRepository,
        super(PlaceLoading()) {
    on<LoadPlace>(_mapLoadPlace);
  }

  Future<void> _mapLoadPlace(LoadPlace event, Emitter<PlaceState> emit) async {
    PlaceLoading();
    try {
      _placeSubscription?.cancel();
      final Place place = await _placesRepository!.getPlaces(event.placeId);
      PlaceLoaded(place: place);
    } catch (_) {}
  }

  @override
  Future<void> close() {
    _placeSubscription?.cancel();
    return super.close();
  }
}
