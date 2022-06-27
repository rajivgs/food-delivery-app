// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String description;
  final String category;
  final double price;
  //final String imageUrl;

  MenuItem({
    required this.id,
    required this.category,
    required this.restaurantId,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  List<Object> get props {
    return [
      id,
      restaurantId,
      name,
      description,
      category,
      price,
    ];
  }

  static List<MenuItem> menuItems = [
    MenuItem(
      id: 1,
      restaurantId: 1,
      name: 'Margherita',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItem(
      id: 2,
      restaurantId: 2,
      name: '4 Formaggi',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItem(
      id: 3,
      restaurantId: 3,
      name: 'Baviera',
      category: 'Pizza',
      description: 'Tomatoes, mozzarella, basil',
      price: 4.99,
    ),
    MenuItem(
      id: 4,
      restaurantId: 4,
      name: 'Coca Cola',
      category: 'Drinks',
      description: 'A fresh drink',
      price: 1.99,
    )
  ];
}
