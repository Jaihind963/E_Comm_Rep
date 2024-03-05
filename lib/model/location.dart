class Location {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final StreetCoordinate street;
  final TimeZone timeZone;
  final Coordinates coordinates;
  Location(
      {required this.city,
      required this.country,
      required this.postcode,
      required this.state,
      required this.street,
      required this.timeZone,
      required this.coordinates});

  factory Location.fromMap(Map<String, dynamic> json) {
    final street = StreetCoordinate.fromMap(json);
    final timeZone = TimeZone.fromMap(json);
    final coordinate = Coordinates.fromMap(json);
    return Location(
        city: json['city'],
        country: json['country'],
        postcode: json['postcode'].toString(),
        state: json['state'],
        street: street,
        timeZone: timeZone,
        coordinates: coordinate);
  }
}

class StreetCoordinate {
  final int number;
  final String name;
  StreetCoordinate({required this.name, required this.number});

  factory StreetCoordinate.fromMap(Map<String, dynamic> json) {
    return StreetCoordinate(
        name: json['street']['name'], number: json['street']['number']);
  }
}

class TimeZone {
  final String offset;
  final String description;

  TimeZone({required this.offset, required this.description});
  factory TimeZone.fromMap(Map<String, dynamic> json) {
    return TimeZone(
        offset: json['timezone']['offset'],
        description: json['timezone']['description']);
  }
}

class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({required this.latitude, required this.longitude});

  factory Coordinates.fromMap(Map<String, dynamic> json) {
    return Coordinates(
        latitude: json['coordinates']['latitude'],
        longitude: json['coordinates']['longitude']);
  }
}
