import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/model/place_autocomplete_model.dart';
import 'package:food_delivery_app/repository/place/place_repository.dart';

part 'autocomplete_event.dart';
part 'autocomplete_state.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlacesRepository _placesRepository;
  StreamSubscription? _placesSubscription;

  AutocompleteBloc({required PlacesRepository placesRepository})
      : _placesRepository = placesRepository,
        super(AutocompleteLoading()) {
    on<LoadAutocomplete>(_onLoadAutoComplete);
  }

  void _onLoadAutoComplete(
      LoadAutocomplete event, Emitter<AutocompleteState> emit) async {
    _placesSubscription?.cancel();
    final List<PlaceAutoComplete>? autocomplete =
        await _placesRepository.getAutoComplete(event.searchInput);

    emit(AutocompleteLoaded(autocomplete: autocomplete!));
  }

  @override
  Future<void> close() async {
    _placesSubscription?.cancel();
    super.close();
  }
}
