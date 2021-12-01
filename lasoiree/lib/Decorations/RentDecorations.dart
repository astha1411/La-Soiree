import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lasoiree/mychats.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'dart:async';
import 'deco.dart';

class RentDecorations extends StatefulWidget {
  @override
  _RentDecorationsState createState() => _RentDecorationsState();
}

class _RentDecorationsState extends State<RentDecorations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Rent Decorations", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.pink[50],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
                child: FutureBuilder<List<ParseObject>>(
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
                                itemBuilder: (context, index) {
                                  //*************************************
                                  //Get Parse Object Values
                                  final varDeco = snapshot.data![index];

                                  final decoData = DecoData(
                                      name: varDeco.get<String>('name')!,
                                      image: varDeco.get<String>('image')!,
                                      desc: varDeco.get<String>('description')!,
                                      location:
                                          varDeco.get<String>('location')!,
                                      rating: varDeco.get<int>('ratings')!);

                                  return Container(
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                    constraints: BoxConstraints(
                                      maxHeight: double.infinity,
                                    ),
                                    width: double.maxFinite,
                                    child: Card(
                                      color: Colors.white,
                                      shape: BeveledRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 5, 10, 10),
                                        child: Container(
                                          child: Column(
                                            children: <Widget>[
                                              toTitle(decoData),
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Container(
                                                      height: 130,
                                                      width: 120,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceAround,
                                                        children: [
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                location(
                                                                    decoData),
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
                                                                description(
                                                                    decoData),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              children: [
                                                                for (var i = 0;
                                                                    i < 5;
                                                                    i++)
                                                                  ratings(
                                                                      decoData,
                                                                      i),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    toImage(decoData),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    0, 17, 0, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
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
                                });
                          }
                      }
                    }))
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
                image: new NetworkImage(data.getImage), fit: BoxFit.cover)),
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
          data.getDescription,
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
              data.getName,
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
          data.getLocation,
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
    if (i < data.getRating) {
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

  Future<List<ParseObject>> getData() async {
    QueryBuilder<ParseObject> queryTodo =
        QueryBuilder<ParseObject>(ParseObject('Decorations'));
    final ParseResponse apiResponse = await queryTodo.query();

    if (apiResponse.success && apiResponse.results != null) {
      return apiResponse.results as List<ParseObject>;
    } else {
      return [];
    }
  }
}
