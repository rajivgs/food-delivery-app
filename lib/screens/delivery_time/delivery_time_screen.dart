import 'package:flutter/material.dart';

class DeliveryScreen extends StatelessWidget {
  static const String routeName = '/delivery';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => DeliveryScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("delivery"),
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
