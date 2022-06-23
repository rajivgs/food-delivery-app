import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  static const String routeName = '/filter';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => FilterScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter"),
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
