class Geolocation {
  String lat;
  String long;

  Geolocation({required this.lat, required this.long});
  @override
  String toString() {
    super.toString();
    return '''{
        "lat": $lat,
        "long": $long
      }''';
  }
}
