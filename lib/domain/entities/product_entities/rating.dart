class Rating {
  Rating({required this.rate, required this.count});
  double rate;
  int count;

  @override
  String toString() {
    super.toString();
    return '''

    {
      "rate": $rate,
      "count": $count
    }''';
  }
}
