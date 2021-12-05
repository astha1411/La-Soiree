import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'plannersclass.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:maps_launcher/maps_launcher.dart';

class PlannersCardWidget extends StatelessWidget {
  final PlannersData plannersData;

  const PlannersCardWidget({
    Key? key,
    required this.plannersData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
          height: 320,
          width: 370,
          child: Card(
              //decoration: const BoxDecoration(color: Colors.red),
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              elevation: 0.0,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 15, 5),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: new NetworkImage(plannersData.getImage),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.0),
                    child: Row(
                      children: [
                        Text(plannersData.getName,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            )),
                        IconButton(
                          icon: const Icon(Icons.call),
                          onPressed: () {
                            launch(('tel://${plannersData.number}'));
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.location_on),
                          onPressed: () {
                            _launchURL();
                          },
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.9, 0.0),
                    child: Text(
                      plannersData.getLocation,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.75, 0.0),
                    child: Text(plannersData.getEvents,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                        )),
                  ),
                  Align(
                    alignment: Alignment(-0.9, 0.0),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 0.0),
                      child: ElevatedButton(
                        onPressed: () {
                          FirebaseFirestore.instance.collection('orders').add({
                            'name': plannersData.getName,
                            'category': 'Organizers'
                          });
                        },
                        child: const Text('Book Now',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(20,
                                25), // takes postional arguments as width and height
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(12), // <-- Radius
                            ),
                            fixedSize: const Size(102, 1),
                            primary: Colors.pink.shade50),
                      ),
                    ),
                  ),
                ],
              ))),
    );
  }
}

void _launchURL() async {
  const String _url =
      'https://www.google.com/maps/dir/19.0767154,72.9106199/4+seasons+events+locations/@25.4379967,76.0478131,9z/data=!4m9!4m8!1m1!4e1!1m5!1m1!1s0x390ce44ec3052baf:0xdae8cb147ced8cb0!2m2!1d77.3247447!2d28.5717267';
  if (!await launch(_url)) throw 'Could not launch $_url';
}
