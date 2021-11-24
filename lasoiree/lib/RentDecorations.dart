import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'decor_data.dart';
import 'package:proj1/mychats.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RentDecorations(),
    );
  }
}

class RentDecorations extends StatefulWidget {
  @override
  _RentDecorationsState createState() => _RentDecorationsState();
}

class _RentDecorationsState extends State<RentDecorations> {
  var decorData = DecorData.getData;
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
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
// scrollDirection: Axis.horizontal,
                  itemCount: decorData.length,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                      constraints: BoxConstraints(
                        maxHeight: double.infinity,
                      ),
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
                                toTitle(decorData[index]),
                                Container(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        height: 130,
                                        width: 120,
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
                                                  location(decorData[index]),
                                                  map(),
                                                  call(),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  description(decorData[index]),
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
                                                        decorData[index], i),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      toImage(decorData[index]),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      rentnow(),
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
        height: 130,
        width: 120,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: new NetworkImage(data['image']), fit: BoxFit.cover)),
      ),
    );
  }

  Widget call() {
    return Icon(
      FontAwesomeIcons.phone,
      size: 20,
    );
  }

  Widget cost() {
    return Icon(
      FontAwesomeIcons.rupeeSign,
      size: 25,
    );
  }

  Widget description(data) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Container(
        width: 120,
        child: Text(
          data['description'],
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ),
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
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
      ),
    );
  }

  Widget map() {
    return Icon(
      FontAwesomeIcons.mapMarker,
      size: 20,
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

  Widget rentnow() {
    return FlatButton(
      padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
      color: Colors.pink[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Rent Now',
        style: TextStyle(fontSize: 20),
      ),
      onPressed: () {},
    );
  }
}
