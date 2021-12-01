import 'package:flutter/material.dart';
import 'package:lasoiree/Planners&Organizers/cards.dart';

import 'plannersclass.dart';
import 'package:lasoiree/AppBar/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lasoiree/mychats.dart';

class PlannersOrganizers extends StatelessWidget {
  final Stream<QuerySnapshot> cakes =
      FirebaseFirestore.instance.collection('planners').snapshots();

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
          body: Container(
              color: Colors.pink[50],
              child: StreamBuilder<QuerySnapshot>(
                stream: cakes,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }

                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return PlannersCardWidget(
                        plannersData: PlannersData(
                            name: data['name'],
                            location: data['location'],
                            image: data['image'],
                            number: data['number'],
                            events: data['events']),
                      );
                    }).toList(),
                  );
                },
              )),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyChats();
              }));
            },
            child: const Icon(Icons.message),
            backgroundColor: Colors.pink,
          ),
        ));
  }
}
