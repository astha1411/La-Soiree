import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lasoiree/Decorations/data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardWidget extends StatelessWidget {
  final DecoData decoData;
  final bool rent;

  const CardWidget({
    Key? key,
    required this.decoData,
    required this.rent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      constraints: BoxConstraints(
        maxHeight: double.infinity,
      ),
      width: double.maxFinite,
      child: Card(
        color: Colors.white,
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
          child: Container(
            child: Column(
              children: <Widget>[
                toTitle(decoData),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        height: 130,
                        width: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  location(decoData),
                                  map(),
                                  call(),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  description(decoData),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  for (var i = 0; i < 5; i++)
                                    ratings(decoData, i),
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
                  padding: EdgeInsets.fromLTRB(0, 17, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (rent) rentnow() else ordernow(decoData),
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
        width: 170,
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
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
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
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.pink[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        'Rent Now',
        style: TextStyle(fontSize: 15),
      ),
      onPressed: () {},
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
            .collection('decorations')
            .add({'name': data.getName, 'category': 'Decorations'});
      },
    );
  }
}
