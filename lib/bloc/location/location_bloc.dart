// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/repository/repository.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final GeolocationRepository _geolocationRepository;
  StreamSubscription? _geoLocationSubscription;

  LocationBloc({
    required GeolocationRepository locationRepository,
  })  : _geolocationRepository = locationRepository,
        super(LocationLoading()) {
    on<LoadMap>(_onLoadMap);
    //on<Updatelocation>(_onSearchLocation);
    on<Updatelocation>(_onSearchLocation);
  }

  void _onLoadMap(
    LoadMap event,
    Emitter<LocationState> emit,
  ) async {
    _geoLocationSubscription?.cancel();
    final Position position = await _geolocationRepository.getCurrentLocation();
    add(Updatelocation(position: position));
    emit(LocationLoaded(position: position));
  }

  void _onSearchLocation(
    Updatelocation event,
    Emitter<LocationState> emit,
  ) async {
    final state = this.state as LocationLoaded;
    LocationLoaded(position: state.position);
  }

  @override
  Future<void> close() async {
    _geoLocationSubscription?.cancel();
    return super.close();
  }
}
