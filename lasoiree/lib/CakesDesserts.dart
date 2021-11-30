import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'cakes_data.dart';
import 'package:lasoiree/mychats.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CakesDesserts(),
    );
  }
}

class CakesDesserts extends StatefulWidget {
  @override
  _CakesDessertsState createState() => _CakesDessertsState();
}

class _CakesDessertsState extends State<CakesDesserts> {
  var cakesData = CakesData.getData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Cakes & Desserts", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.pink[50],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
// scrollDirection: Axis.horizontal,
                  itemCount: cakesData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      height: 250,
                      width: double.maxFinite,
                      child: Card(
                        color: Colors.white,
                        shape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                toTitle(cakesData[index]),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      toImage(cakesData[index]),
                                      Container(
                                        height: 100,
                                        width: 130,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  call(),
                                                  cost(),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  location(cakesData[index]),
                                                  map(),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  for (var i = 0; i < 5; i++)
                                                    ratings(
                                                        cakesData[index], i),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      requestinfo(),
                                      ordernow(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
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

  Widget toImage(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Container(
        height: 100,
        width: 180,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: new NetworkImage(data['image']), fit: BoxFit.cover)),
      ),
    );
  }

  Widget call() {
    return Icon(
      FontAwesomeIcons.phone,
      size: 25,
    );
  }

  Widget cost() {
    return Icon(
      FontAwesomeIcons.rupeeSign,
      size: 25,
    );
  }

  Widget toTitle(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        child: Card(
          color: Colors.pink[100],
          child: ListTile(
            title: Text(
              data['name'],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }

  Widget location(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Container(
        child: Text(
          data['location'],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
      ),
    );
  }

  Widget map() {
    return Icon(
      FontAwesomeIcons.mapMarker,
      size: 25,
    );
  }

  Widget ratings(data, i) {
    if (i < data['ratings']) {
      return Icon(
        Icons.star_rate,
        color: Colors.pink[200],
        size: 23,
      );
    } else {
      return Icon(
        Icons.star_rate,
        size: 23,
      );
    }
  }

  Widget requestinfo() {
    return FlatButton(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.pink[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Request Info',
        style: TextStyle(fontSize: 15),
      ),
      onPressed: () {},
    );
  }

  Widget ordernow() {
    return FlatButton(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.pink[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Order Now',
        style: TextStyle(fontSize: 15),
      ),
      onPressed: () {},
    );
  }
}