// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/filter/filter_bloc.dart';

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
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<FilterBloc, FilterState>(
              builder: (context, state) {
                if (state is FilterLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FilterLoaded) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      shape: RoundedRectangleBorder(),
                      primary: Theme.of(context).colorScheme.secondary,
                    ),
                    onPressed: () {
                      var categories = state.filter.categoryFilters
                          .where((filter) => filter.value)
                          .map((filter) => filter.category.name)
                          .toList();

                      var price = state.filter.priceFilters
                          .where((filter) => filter.value)
                          .map((filter) => filter.price.price)
                          .toList();

                      List<Restaurant> restaurant = Restaurant.restaurants
                          .where(
                            (restaurant) => categories.any((category) =>
                                restaurant.tags.contains(category)),
                          )
                          .where(
                            (restaurant) => price.any((price) =>
                                restaurant.priceCategory.contains(price)),
                          )
                          .toList();

                      Navigator.pushNamed(context, '/restaurant_listing',
                          arguments: restaurant);
                    },
                    child: Text('Apply  '),
                  );
                } else {
                  return Text("Something went wrong!");
                }
              },
            ),
          ],
        )),
      ),
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
