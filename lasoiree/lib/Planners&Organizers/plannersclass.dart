class PlannersData {
  String name;
  String events;
  String location;
  String number;
  String image;

  PlannersData({
    required this.name,
    required this.image,
    required this.location,
    required this.number,
    required this.events,
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

  String get getPhone {
    return number;
  }

  String get getEvents {
    return events;
  }
}
