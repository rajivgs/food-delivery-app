// ignore_for_file: prefer_const_constructors_in_immutables

part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  LocationEvent();

  @override
  List<Object?> get props => [];
}

class LoadMap extends LocationEvent {}

class Updatelocation extends LocationEvent {
  final Position position;

  Updatelocation({required this.position});

  @override
  List<Object?> get props => [position];
}

class SearchLocation extends LocationEvent {
  final String placeId;

  SearchLocation({required this.placeId});

  @override
  List<Object?> get props => [placeId];
}
