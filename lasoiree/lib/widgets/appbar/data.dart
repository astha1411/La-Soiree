class AppBarModel {
  final String title;
  final String route;

  const AppBarModel({required this.title, required this.route});

  static const planners =
      AppBarModel(title: "Planners & Organizers", route: "");

  static const categories = AppBarModel(title: "Categories", route: "");

  static const chats = AppBarModel(title: "Chats", route: "");
}
