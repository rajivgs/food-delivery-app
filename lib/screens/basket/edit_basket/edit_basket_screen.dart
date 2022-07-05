// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/basket/basket_bloc.dart';

class EditBasketScreen extends StatelessWidget {
  const EditBasketScreen({Key? key}) : super(key: key);
  static const String routeName = '/edit-basket';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => EditBasketScreen(),
        settings: RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 245, 242, 242),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.close,
                  color: Theme.of(context).primaryColor,
                )),
          ],
          title: Center(
            child: Text(
              "Edit Basket",
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
          ),
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
                  Navigator.pop(context);
                },
                child: Text('Done'),
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
                                      IconButton(
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () {
                                            context.read<BasketBloc>()
                                              ..add(RemoveAllItem(state.basket
                                                  .itemQuntity(
                                                      state.basket.items)
                                                  .keys
                                                  .elementAt(index)));
                                          },
                                          icon: Icon(Icons.delete)),
                                      IconButton(
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () {
                                            context.read<BasketBloc>()
                                              ..add(RemoveItem(state.basket
                                                  .itemQuntity(
                                                      state.basket.items)
                                                  .keys
                                                  .elementAt(index)));
                                          },
                                          icon: Icon(Icons.remove_circle)),
                                      IconButton(
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () {
                                            context.read<BasketBloc>()
                                              ..add(AddItem(state.basket
                                                  .itemQuntity(
                                                      state.basket.items)
                                                  .keys
                                                  .elementAt(index)));
                                          },
                                          icon: Icon(Icons.add_circle)),
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
              ],
            ),
          ),
        ));
  }
}
