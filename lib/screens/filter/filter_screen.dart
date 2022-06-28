// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../../model/model.dart';
import '../../widget/widget.dart';

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
      appBar: AppBar(title: Text("Filter")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Price",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            //    CustomPriceFilter(price: Price.priceList),
            CustomPriceFilter(),
            SizedBox(height: 10),
            Text(
              "Category",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            //  CustomCategoryFilter(categories: Category.categories),
            CustomCategoryFilter(),
          ],
        ),
      ),
    );
  }
}
