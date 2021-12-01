import 'package:flutter/material.dart';
import 'package:lasoiree/Planners&Organizers/widgets/cards.dart';
import 'package:lasoiree/Planners&Organizers/plannersclass.dart';
import 'package:lasoiree/Appbar/appbar.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:async';

class PlannersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Mini Project',
      home: Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar: AppBarWidget(
          title: 'Planners & Organizers',
          backgroundColor: Colors.white,
        ),
        body: FutureBuilder<List<ParseObject>>(
            future: getData(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: Container(
                        width: 100,
                        height: 100,
                        child: CircularProgressIndicator()),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Error..."),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: Text("No Data..."),
                    );
                  } else {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          final varPlanners = snapshot.data![index];

                          final plannersData = PlannersData(
                              name: varPlanners.get<String>('name')!,
                              image: varPlanners.get<String>('image')!,
                              number: varPlanners.get<String>('number')!,
                              location: varPlanners.get<String>('location')!,
                              events: varPlanners.get<String>('events')!);
                          return PlannersCardWidget(
                            name: plannersData.getName,
                            image: plannersData.getImage,
                            location: plannersData.getLocation,
                            events: plannersData.getEvents,
                            number: plannersData.getPhone,
                          );
                        });
                  }
              }
            }),
      ),
    );
  }

  Future<List<ParseObject>> getData() async {
    QueryBuilder<ParseObject> queryTodo =
        QueryBuilder<ParseObject>(ParseObject('Planners'));
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}
