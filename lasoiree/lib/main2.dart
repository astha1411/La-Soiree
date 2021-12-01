import 'package:flutter/material.dart';
import 'package:lasoiree/Appbar/appbar.dart';

import 'package:lasoiree/orders/orderspage.dart';
import 'package:lasoiree/Users/SignIn.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
