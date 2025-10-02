class Name {
  String firstname;
  String lastname;

  Name({required this.firstname, required this.lastname});

  @override
  String toString() {
    super.toString();
    return '''{
      "firstname": $firstname,
      "lastname": "$lastname"
    }''';
  }
}
