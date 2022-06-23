// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/bloc/autocomplete/autocomplete_bloc.dart';
import 'package:food_delivery_app/bloc/location/location_bloc.dart';
import 'package:food_delivery_app/widget/gmap.dart';

import '../../widget/location_search_box.dart';

class LocationScreen extends StatelessWidget {
  static const String routeName = '/location';
  static Route route() {
    return MaterialPageRoute(
      builder: (_) => LocationScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: BlocBuilder<LocationBloc, LocationState>(
              builder: (context, state) {
                if (state is LocationLoading) {
                  print("Demo Location Loaded ---- ");
                  return CircularProgressIndicator();
                } else if (state is LocationLoaded) {
                  print("Location Updated -----");
                  return Gmap(
                      lat: state.position.latitude,
                      lng: state.position.longitude);
                } else {
                  return Text("Something is wrong ");
                }
              },
            )),
        Positioned(
          top: 40,
          left: 20,
          right: 20,
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/logo.svg',
                  height: 50,
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Column(
                  children: [
                    LocationSearchBox(),
                    BlocBuilder<AutocompleteBloc, AutocompleteState>(
                        builder: (context, state) {
                      if (state is AutocompleteLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is AutocompleteLoaded) {
                        return Container(
                            margin: const EdgeInsets.all(8.0),
                            height: 20,
                            color: state.autocomplete.isNotEmpty
                                ? Colors.black.withOpacity(0.5)
                                : Colors.transparent,
                            child: ListView.builder(
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      "Placeholder",
//                                      state.autocomplete[index].description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(color: Colors.white),
                                    ),
                                  );
                                }));
                      } else {
                        return Text("Something went wrong!");
                      }
                    })
                  ],
                )),
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                child: Text("Save"),
                onPressed: () {},
              ),
            ))
      ],
    ));
  }
}
