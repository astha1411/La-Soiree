class PhotoData {
  String name;
  String image;
  String location;
  int ratings;

  PhotoData(
      {required this.name,
      required this.image,
      required this.location,
      required this.ratings});

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
    return ratings;
  }
}
