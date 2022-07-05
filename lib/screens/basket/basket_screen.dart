// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/bloc/basket/basket_bloc.dart';

class BasketScreen extends StatelessWidget {
  static const String routeName = '/basket';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => BasketScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("basket"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/edit-basket');
                },
                icon: Icon(Icons.edit)),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  shape: RoundedRectangleBorder(),
                  primary: Theme.of(context).colorScheme.secondary,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/basket');
                },
                child: Text('Go TO Checkout'),
              ),
            ],
          )),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cutlery",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 234, 231, 231),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Do you need cutlery?",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ),
                      BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          if (state is BasketLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is BasketLoaded) {
                            return SizedBox(
                              width: 100,
                              child: SwitchListTile(
                                dense: true,
                                value: state.basket.cutlery,
                                onChanged: (bool? newValue) {
                                  context
                                      .read<BasketBloc>()
                                      .add(ToggleSwitch());
                                },
                              ),
                            );
                          } else {
                            return Text("Something is wrong");
                          }
                        },
                      )
                    ],
                  ),
                ),
                Text(
                  "Items",
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
                BlocBuilder<BasketBloc, BasketState>(
                  builder: (context, state) {
                    if (state is BasketLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is BasketLoaded) {
                      return state.basket.items.length == 0
                          ? Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(top: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Row(
                                children: [
                                  Text(
                                    "No Items in the Basket",
                                    textAlign: TextAlign.left,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: state.basket
                                  .itemQuntity(state.basket.items)
                                  .keys
                                  .length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 10),
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 234, 231, 231),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        '${state.basket.itemQuntity(state.basket.items).entries.elementAt(index).value}x',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: Text(
                                          '${state.basket.itemQuntity(state.basket.items).keys.elementAt(index).name} ',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                      ),
                                      Text(
                                        "\$${state.basket.itemQuntity(state.basket.items).keys.elementAt(index).price}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                    } else {
                      return Text("Something is wrong");
                    }
                  },
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 231, 231),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/delivery_time.svg'),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Delivery in 20 minutes",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Change'),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 231, 231),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        //  crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 20),
                          Text(
                            "Do you have a voucher?",
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(
                                    color: Theme.of(context).primaryColor),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text('Apply'),
                          )
                        ],
                      ),
                      SvgPicture.asset(
                        'assets/coupon.svg',
                        height: 100,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 100,
                  margin: const EdgeInsets.only(top: 5),
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 234, 231, 231),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: BlocBuilder<BasketBloc, BasketState>(
                    builder: (context, state) {
                      if (state is BasketLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is BasketLoaded) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Subtotal',
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                Text('\$${state.basket.subtotalString}',
                                    style:
                                        Theme.of(context).textTheme.headline6),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Delivery Fee',
                                    style:
                                        Theme.of(context).textTheme.headline6),
                                Text('\$5.00',
                                    style:
                                        Theme.of(context).textTheme.headline6),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(
                              height: 5,
                              color: Color.fromARGB(255, 169, 165, 165),
                              thickness: 3,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .primaryColor)),
                                Text('\$${state.basket.totalString}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(
                                            color: Theme.of(context)
                                                .primaryColor)),
                              ],
                            )
                          ],
                        );
                      } else {
                        return Text("Semothing is Wrong");
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
