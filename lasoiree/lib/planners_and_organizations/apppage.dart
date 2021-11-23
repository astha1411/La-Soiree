import 'package:flutter/material.dart';
import 'package:lasoiree/planners_and_organizations/widgets/cards.dart';
import 'package:lasoiree/planners_and_organizations/data.dart';
import 'package:lasoiree/widgets/appbar/appbar.dart';

class PlannersPage extends StatelessWidget {
  List data = PlannersData.getData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Mini Project',
      home: Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar:
            AppBarWidget(title: 'Planners & Organizers', backgroundColor : Colors.white,),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return PlannersCardWidget(
                name: data[index]['name'],
                image: data[index]['image'],
                location: data[index]['location'],
                events: data[index]['events'],
                number: data[index]['number'],
              );
            }),
      ),
    );
  }
}
