class CakesData {
  String name;
  String image;
  String location;
  int rating;

  CakesData(
      {required this.name,
      required this.image,
      required this.location,
      required this.rating});

  String get getName {
    return name;
  }

  String get getImage {
    return image;
  }

  String get getLocation {
    return location;
  }

  int get getRating {
    return rating;
  }
}
