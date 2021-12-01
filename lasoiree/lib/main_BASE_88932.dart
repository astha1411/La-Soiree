import 'package:flutter/material.dart';

import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:lasoiree/Categories/categories.dart';
import 'package:lasoiree/Decorations/Decorations.dart';
import 'package:lasoiree/Cakes&Desserts/CakesDesserts.dart';
import 'package:lasoiree/Planners&Organizers/apppage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final keyApplicationId = 'NJbgexsdPRQ1VdAToeixX1NkoHfcpXO01Fs9Lk6E';
  final keyClientKey = '2lHrjv9YtPvZHATKRD4RwTyf3csxswNxfYabByk0';
  final keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, autoSendSessionId: true);

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
