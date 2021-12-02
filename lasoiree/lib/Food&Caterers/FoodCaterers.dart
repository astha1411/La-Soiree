import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lasoiree/mychats.dart';
import 'cards.dart';
import 'package:lasoiree/Food&Caterers/data.dart';

class FoodCaterers extends StatefulWidget {
  @override
  _FoodCaterersState createState() => _FoodCaterersState();
}

class _FoodCaterersState extends State<FoodCaterers> {
  final Stream<QuerySnapshot> food =
      FirebaseFirestore.instance.collection('food').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Food & Caterers", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Container(
          color: Colors.pink[50],
          child: StreamBuilder<QuerySnapshot>(
            stream: food,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  return CardWidget(
                    foodData: FoodData(
                        name: data['name'],
                        location: data['location'],
                        image: data['image'],
                        ratings: data['ratings']),
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
    );
  }
}
