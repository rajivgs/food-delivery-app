// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RestaurantScreen extends StatelessWidget {
  static const String routeName = '/restaurant';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => RestaurantScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const RestaurantScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("restaurant"),
      ),
      body: ElevatedButton(
        child: Text('Location Screen'),
        onPressed: () {
          Navigator.pushNamed(context, '/location');
        },
      ),
    );
  }
}
