import 'package:flutter/foundation.dart';

class appbarmodel {
  final String title;
  final String route;

  const appbarmodel({required this.title, required this.route});

  static const planners =
      appbarmodel(title: "Planners & Organizers", route: "");

  static const categories = appbarmodel(title: "Categories", route: "");

  static const chats = appbarmodel(title: "Chats", route: "");
}
