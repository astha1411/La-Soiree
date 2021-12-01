class BandsDJsData {
  String name;
  String genre;
  int countRs;
  String location;
  //int number;
  int rating;
  String image;

  BandsDJsData({
    required this.name,
    required this.image,
    required this.location,
    required this.rating,
    required this.countRs,
    required this.genre,
  });

  String get getName {
    return name;
  }

  String get getImage {
    return image;
  }

  String get getLocation {
    return location;
  }

  int get getcountRs {
    return countRs;
  }

  String get getGenre {
    return genre;
  }
}
