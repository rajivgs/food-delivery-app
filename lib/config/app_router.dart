// ignore_for_file: no_duplicate_case_values, avoid_print

import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/basket/basket_screen.dart';
import 'package:food_delivery_app/screens/checkout/checkout_screen.dart';
import 'package:food_delivery_app/screens/delivery_time/delivery_time_screen.dart';
import 'package:food_delivery_app/screens/filter/filter_screen.dart';
import 'package:food_delivery_app/screens/restaurant_details/restaurant_details_screen.dart';
import 'package:food_delivery_app/screens/screen.dart';
import 'package:food_delivery_app/screens/voucher/voucher_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is: ${settings.name}');

    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case DeliveryScreen.routeName:
        return DeliveryScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case RestaurantScreen.routeName:
        return RestaurantScreen.route();
      case VoucherScreen.routeName:
        return VoucherScreen.route();
        break;
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text("Error")),
      ),
      settings: const RouteSettings(name: "/error"),
    );
  }
}
