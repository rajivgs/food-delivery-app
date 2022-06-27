// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../model/model.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({
    Key? key,
    required this.restaurant,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                      image: NetworkImage(restaurant.imageUrl),
                      fit: BoxFit.cover),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Text('${restaurant.deliveryTime} min',
                      style: Theme.of(context).textTheme.bodyText1),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(restaurant.name,
                    style: Theme.of(context).textTheme.headline5),
                SizedBox(height: 5),
                Row(
                    children: restaurant.tags
                        .map(
                          (tag) => restaurant.tags.indexOf(tag) ==
                                  restaurant.tags.length - 1
                              ? Text(tag,
                                  style: Theme.of(context).textTheme.bodyText1)
                              : Text('$tag,',
                                  style: Theme.of(context).textTheme.bodyText1),
                        )
                        .toList()),
                SizedBox(height: 5),
                Text(
                    '${restaurant.distance}km - \$${restaurant.deliveryFee} delivery fee',
                    style: Theme.of(context).textTheme.bodyText1),
              ],
            ),
          )
        ],
      ),
    );
  }
}