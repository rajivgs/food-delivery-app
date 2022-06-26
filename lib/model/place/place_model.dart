class Place {
  final String placeId;
  final String name;
  final double lat;
  final double lng;

  Place(
      {required this.lat,
      required this.lng,
      this.placeId = '',
      this.name = ''});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      placeId: json['placeId'],
      name: json['formatted_address'],
      lat: json['geometery']['location']['lat'],
      lng: json['geometery']['location']['lng'],
    );
  }
}
