import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/model.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading()) {
    //  on<BasketEvent>((event, emit) {});
    on<StartBasket>(_mapStartBasketToState);
    on<AddBasket>(_mapAddBasketToState);
    on<RemoveBasket>(_mapRemovetBasketToState);
    on<ToggleSwitch>(_mapToggleSwitchToState);
  }

  void _mapStartBasketToState(
      StartBasket event, Emitter<BasketState> emit) async {
    emit(BasketLoading());
    try {
      await Future<void>.delayed(const Duration(seconds: 1));
      emit(BasketLoaded(basket: Basket()));
    } catch (_) {}
  }

  void _mapAddBasketToState(AddBasket event, Emitter<BasketState> emit) async {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(
          BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)..add(event.item)),
          ),
        );
      } catch (_) {}
    }
  }

  void _mapRemovetBasketToState(
      RemoveBasket event, Emitter<BasketState> emit) async {
    final state = this.state;
    if (state is BasketLoaded) {
      try {
        emit(BasketLoaded(
            basket: state.basket.copyWith(
                items: List.from(state.basket.items)..remove(event.item))));
      } catch (_) {}
    }
  }

  void _mapToggleSwitchToState(
      ToggleSwitch event, Emitter<BasketState> emit) async {
    final state = this.state;
    try {
      if (state is BasketLoaded) {
        emit(BasketLoaded(
            basket: state.basket.copyWith(cutlery: !state.basket.cutlery)));
      }
    } catch (_) {}
  }
}
