import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String name;
  final String category;
  final bool isCancel;

  const CardWidget({
    Key? key,
    this.name = '',
    this.category = '',
    this.isCancel = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Stack(alignment: Alignment.topCenter, children: <Widget>[
          Container(
              height: 170,
              width: 370,
              child: Card(
                //decoration: const BoxDecoration(color: Colors.red),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                elevation: 0.0,
              )),

          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          Positioned(
            top: 90,
            left: 35,
            child: Text(
              category,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          Container(
              height: 67,
              width: 375,
              child: Card(
                  color: Colors.pink[100],
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  elevation: 0.0,
                  child: Center(
                    child: Text(
                      name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ))),

          Positioned(
              top: 120,
              child: SizedBox(
                  width: 300,
                  height: 35,
                  child: ElevatedButton(
                    child: isCancel
                        ? Text(
                            "Cancel Order",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : Text(
                            "Reorder",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                    onPressed: () {
                      print('Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), // <-- Radius
                      ),
                      elevation: 10,
                      primary: Colors.pink.shade50,
                    ),
                  )))
        ]));
  }
}
