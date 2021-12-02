import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lasoiree/Photography&Video/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardWidget extends StatelessWidget {
  final PhotoData photoData;
  bool requested = false;

  CardWidget({
    Key? key,
    required this.photoData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(5, 10, 5, 0),
      height: 280,
      width: double.maxFinite,
      child: Card(
        color: Colors.white,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Container(
            child: Column(
              children: <Widget>[
                toTitle(photoData),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      toImage(photoData),
                      Container(
                        height: 100,
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  call(),
                                  cost(),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  location(photoData),
                                  map(),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (var i = 0; i < 5; i++)
                                    ratings(photoData, i),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      requestinfo(),
                      ordernow(photoData),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
                image: new NetworkImage(data.getImage), fit: BoxFit.cover)),
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

  Widget requestinfo() {
    return FlatButton(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.pink[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        requested ? "Reuested" : "Request Info",
        style: TextStyle(fontSize: 15),
      ),
      onPressed: () {
        if (requested) {
          return null;
        }
      },
    );
  }

  Widget ordernow(data) {
    return FlatButton(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.pink[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Order Now',
        style: TextStyle(fontSize: 15),
      ),
      onPressed: () {
        FirebaseFirestore.instance
            .collection('orders')
            .add({'name': data.getName, 'category': 'Photography & Video'});
      },
    );
  }

  toList() {}
}
