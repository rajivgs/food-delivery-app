// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:food_delivery_app/model/category/price_filter_model.dart';

import '../../model/model.dart';

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
            CustomPriceFilter(price: Price.priceList),
            SizedBox(height: 10),
            Text(
              "Category",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            CustomCategoryFilter(categories: Category.categories),
          ],
        ),
      ),
    );
  }
}

class CustomPriceFilter extends StatelessWidget {
  final List<Price> price;
  const CustomPriceFilter({
    Key? key,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: price
            .map((price) => InkWell(
                  onTap: (() {}),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 121, 118, 118),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      price.price,
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                ))
            .toList());
  }
}

class CustomCategoryFilter extends StatelessWidget {
  final List<Category> categories;
  const CustomCategoryFilter({Key? key, required this.categories})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 243, 239, 239),
                borderRadius: BorderRadius.circular(5)),
            width: double.infinity,
            margin: const EdgeInsets.only(top: 10),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  categories[index].name,
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 25,
                  child: Checkbox(
                    value: false,
                    onChanged: (bool? newValue) {},
                  ),
                )
              ],
            ),
          );
        });
  }
}
