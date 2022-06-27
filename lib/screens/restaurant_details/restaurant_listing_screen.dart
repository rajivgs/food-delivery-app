// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:food_delivery_app/widget/restaurant_card.dart';

import '../../model/model.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = '/restaurant_listing';
  static Route route({required List<Restaurant> restaurant}) {
    return MaterialPageRoute(
      builder: (_) => RestaurantListingScreen(restaurant: restaurant),
      settings: RouteSettings(name: routeName),
    );
  }

  final List<Restaurant> restaurant;

  const RestaurantListingScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Restaurants"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: restaurant.length,
            itemBuilder: ((context, index) {
              return RestaurantCard(restaurant: restaurant[index]);
            }),
          ),
        ));
  }
}
