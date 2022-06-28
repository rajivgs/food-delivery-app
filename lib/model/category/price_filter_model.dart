// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

import '../model.dart';

class PriceFilter extends Equatable {
  final int id;
  final Price price;
  final bool value;

  PriceFilter({
    required this.id,
    required this.price,
    required this.value,
  });

  PriceFilter copywith({
    int? id,
    Price? price,
    bool? value,
  }) {
    return PriceFilter(
      id: id ?? this.id,
      price: price ?? this.price,
      value: value ?? this.value,
    );
  }

  @override
  List<Object> get props => [id, price, value];

  static List<PriceFilter> filters = Price.priceList
      .map((price) => PriceFilter(id: price.id, price: price, value: false))
      .toList();
}
