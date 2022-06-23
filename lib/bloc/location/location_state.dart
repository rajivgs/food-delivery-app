// ignore_for_file: prefer_const_constructors_in_immutables

part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();
  @override
  List<Object?> get props => [];
}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final Position position;
  LocationLoaded({
    required this.position,
  });
  @override
  List<Object?> get props => [position];
}

class GeolocationError extends LocationState {}
