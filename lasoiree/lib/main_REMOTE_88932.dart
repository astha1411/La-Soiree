import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lasoiree/Categories/categories.dart';


//import 'package:lasoiree/Decorations/Decorations.dart';
import 'package:lasoiree/Decorations/RentDecorations.dart';
import 'package:lasoiree/Cakes&Desserts/CakesDesserts.dart';
import 'package:lasoiree/Planners&Organizers/Planners&Organizers.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Categories(),
    );
  }
}
