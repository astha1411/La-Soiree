import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lasoiree/mychats.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'data.dart';

class Decorations extends StatefulWidget {
  @override
  _DecorationsState createState() => _DecorationsState();
}

class _DecorationsState extends State<Decorations> {
  final Stream<QuerySnapshot> decorations =
      FirebaseFirestore.instance.collection('decorations').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Decorations", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.pink[50],
        child: StreamBuilder<QuerySnapshot>(
          stream: decorations,
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
                  decoData: DecoData(
                      name: data['name'],
                      location: data['location'],
                      image: data['image'],
                      desc: data['description'],
                      rating: data['ratings']),
                  rent: false,
                );
              }).toList(),
            );
          },
        ),
      ),
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
