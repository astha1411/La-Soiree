class DecoData {
  String name;
  String image;
  String location;
  int rating;
  String desc;

  DecoData(
      {required this.name,
      required this.image,
      required this.location,
      required this.rating,
      required this.desc});

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

  String get getDescription {
    return desc;
  }
}
