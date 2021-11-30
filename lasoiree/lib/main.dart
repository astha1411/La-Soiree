import 'package:flutter/material.dart';
import 'package:lasoiree/widgets/appbar/appbar.dart';
import 'package:lasoiree/planners_and_organizations/widgets/cards.dart';
import 'package:lasoiree/planners_and_organizations/apppage.dart';
import 'package:lasoiree/orders/orderspage.dart';
import 'package:lasoiree/SignIn.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SignIn();
  }
}
