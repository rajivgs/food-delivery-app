// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:equatable/equatable.dart';

import '../model.dart';

class Restaurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;

  const Restaurant({
    required this.menuItems,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.distance,
  });

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        name,
        tags,
        deliveryTime,
        deliveryFee,
        distance,
      ];

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      name: 'Golden Ice Gelato Artigianale',
      imageUrl:
          'https://images.unsplash.com/photo-1479044769763-c28e05b5baa5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      // tags: MenuItem.menuItems
      //     .where((menuItem) => menuItem.restaurantId == 1)
      //     .map((menuItem) => menuItem.category)
      //     .toSet()
      //     .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 1)
          .toList(),
      tags: ['Italian', 'Dessert', 'Ice Cream'],
      deliveryTime: 30,
      deliveryFee: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 2,
      name: 'Il Panino del Laghetto',
      imageUrl:
          'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      // tags: MenuItem.menuItems
      //     .where((menuItem) => menuItem.restaurantId == 2)
      //     .map((menuItem) => menuItem.category)
      //     .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 2)
          .toList(),
      tags: ['Italian', 'Dessert', 'Ice Cream'],
      deliveryTime: 30,
      deliveryFee: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 3, tags: ['Italian', 'Dessert', 'Ice Cream'],

      name: 'Viaggi Nel Gusto',
      imageUrl:
          'https://images.unsplash.com/photo-1555396273-367ea4eb4db5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80',
      // tags: MenuItem.menuItems
      //     .where((menuItem) => menuItem.restaurantId == 3)
      //     .map((menuItem) => menuItem.category)
      //     .toSet()
      //     .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 3)
          .toList(),
      deliveryTime: 30,
      deliveryFee: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 4,
      tags: ['Italian', 'Dessert', 'Ice Cream'],

      name: 'Burgers',
      imageUrl:
          'https://images.unsplash.com/photo-1550547660-d9450f859349?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=701&q=80',
      // tags: MenuItem.menuItems
      //     .where((menuItem) => menuItem.restaurantId == 4)
      //     .map((menuItem) => menuItem.category)
      //     .toSet()
      //     .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 4)
          .toList(),
      deliveryTime: 30,
      deliveryFee: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 5,
      name: 'Tandoori Bites',
      imageUrl:
          'https://images.unsplash.com/photo-1428515613728-6b4607e44363?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
      // tags: MenuItem.menuItems
      //     .where((menuItem) => menuItem.restaurantId == 5)
      //     .map((menuItem) => menuItem.category)
      //     .toSet()
      //     .toList(),
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 5)
          .toList(),
      tags: ['Italian', 'Dessert', 'Ice Cream'],

      deliveryTime: 30,
      deliveryFee: 2.99,
      distance: 0.4,
    )
  ];
}
