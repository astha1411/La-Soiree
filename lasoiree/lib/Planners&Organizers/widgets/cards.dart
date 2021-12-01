import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:maps_launcher/maps_launcher.dart';

class PlannersCardWidget extends StatelessWidget {
  final String name;
  final String image;
  final String events;
  final String location;
  final String number;

  const PlannersCardWidget({
    Key? key,
    this.events = '',
    this.image = '',
    this.name = '',
    this.location = '',
    this.number = '',
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
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 13.0),
                    child: Row(
                      children: [
                        Text(name,
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            )),
                        IconButton(
                          icon: const Icon(Icons.call),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(Icons.location_on),
                          onPressed: () {
                            // _makePhoneCall('tel://${number}');
                          }, //async
                          //launch('tel://${number}');
                          //launch('tel:98765433');

                          //},
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.9, 0.0),
                    child: Text(
                      location,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(-0.75, 0.0),
                    child: Text(events,
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
                        onPressed: () {},
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

Future<void> _makePhoneCall(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
