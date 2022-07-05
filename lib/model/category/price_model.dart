// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final int id;
  final String price;

  Price({
    required this.id,
    required this.price,
  });

  @override
  List<Object> get props => [id, price];

  static List<Price> priceList = [
    Price(id: 1, price: '\$'),
    Price(id: 2, price: '\$\$'),
    Price(id: 3, price: '\$\$\$')
  ];
}
