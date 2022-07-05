import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/model.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterLoading()) {
    on<FilterLoad>(_mapFilterLoadToState);
    on<CategoryFilterUpdated>(_mapCategoryFilterUpdated);
    on<PriceFilterUpdated>(_mapPriceFilterUpdated);
  }

  void _mapFilterLoadToState(
      FilterLoad event, Emitter<FilterState> emit) async {
    emit(
      FilterLoaded(
        filter: Filter(
            categoryFilters: CategoryFilter.filters,
            priceFilters: PriceFilter.filters),
      ),
    );
  }

  void _mapCategoryFilterUpdated(
      CategoryFilterUpdated event, Emitter<FilterState> emit) async {
    final state = this.state;
    if (state is FilterLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();
      emit(
        FilterLoaded(
          filter: Filter(
              categoryFilters: updatedCategoryFilters,
              priceFilters: state.filter.priceFilters),
        ),
      );
    }
  }

  void _mapPriceFilterUpdated(
      PriceFilterUpdated event, Emitter<FilterState> emit) async {
    final state = this.state;
    if (state is FilterLoaded) {
      final List<PriceFilter> updatedPriceFilters =
          state.filter.priceFilters.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();
      emit(
        FilterLoaded(
            filter: Filter(
          categoryFilters: state.filter.categoryFilters,
          priceFilters: updatedPriceFilters,
        )),
      );
    }
  }
}
