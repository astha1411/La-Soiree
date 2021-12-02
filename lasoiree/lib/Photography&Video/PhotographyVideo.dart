import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lasoiree/mychats.dart';
import 'cards.dart';
import 'data.dart';

class PhotographyVideos extends StatefulWidget {
  @override
  _PhotographyVideosState createState() => _PhotographyVideosState();
}

class _PhotographyVideosState extends State<PhotographyVideos> {
  final Stream<QuerySnapshot> photo =
      FirebaseFirestore.instance.collection('photo').snapshots();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Mini Project',
      home: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text("Photographers & Video",
              style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Container(
            color: Colors.pink[50],
            child: StreamBuilder<QuerySnapshot>(
              stream: photo,
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
                    return CardWidget(
                      photoData: PhotoData(
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
      ),
    );
  }
}
