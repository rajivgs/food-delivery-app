// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/bloc/autocomplete/autocomplete_bloc.dart';
import 'package:food_delivery_app/bloc/location/location_bloc.dart';
import 'package:food_delivery_app/config/app_router.dart';
import 'package:food_delivery_app/repository/geoLocationRepository/geolocation_repository.dart';
import 'package:food_delivery_app/repository/place/place_repository.dart';

import 'bloc/place/place_bloc.dart';
import 'config/theme.dart';
import 'screens/screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
            create: (_) => GeolocationRepository()),
        RepositoryProvider<PlacesRepository>(create: (_) => PlacesRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => LocationBloc(
                  locationRepository: context.read<GeolocationRepository>())
                ..add(LoadMap())),
          BlocProvider(
              create: (context) => AutocompleteBloc(
                  placesRepository: context.read<PlacesRepository>())
                ..add(LoadAutocomplete())),
          BlocProvider(
              create: (context) => PlaceBloc(
                  placesRepository: context.read<PlacesRepository>())),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Food Delivery',
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ),
      ),
    );
  }
}
