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
}

class StreetCoordinate {
  final int number;
  final String name;
  StreetCoordinate({required this.name, required this.number});
}

class TimeZone {
  final String offset;
  final String description;

  TimeZone({required this.offset, required this.description});
}

class Coordinates {
  final String latitude;
  final String longitude;

  Coordinates({required this.latitude, required this.longitude});
}
