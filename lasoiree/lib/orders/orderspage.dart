import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lasoiree/AppBar/appbar.dart';
import 'package:lasoiree/orders/data/previousorders.dart';
import 'package:lasoiree/orders/data/currentorders.dart';
import 'package:lasoiree/orders/cards.dart';
import 'package:lasoiree/mychats.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final Stream<QuerySnapshot> orders =
      FirebaseFirestore.instance.collection('orders').snapshots();
  final Stream<QuerySnapshot> prevo =
      FirebaseFirestore.instance.collection('preorders').snapshots();
  bool isPrev = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Mini Project',
      home: Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar: AppBarWidget(
          title: 'La Soiree',
          backgroundColor: Colors.pink.shade50,
        ),
        body: Container(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 75,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                              width: 5.0,
                              color: isPrev ? Colors.grey : Colors.black),
                        ),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            isPrev = false;
                          });
                        },
                        child: const Text(
                          'My Orders',
                          style: TextStyle(
                            fontSize: 27,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 75,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 5.0,
                                color: isPrev ? Colors.black : Colors.grey),
                          ),
                        ),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              isPrev = true;
                            });
                          },
                          child: const Text(
                            'Previous Orders',
                            style: TextStyle(
                              fontSize: 27,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 200,
                child: isPrev
                    ? StreamBuilder<QuerySnapshot>(
                        stream: prevo,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }

                          return ListView(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              return CardWidget(
                                name: data['name'],
                                category: data['category'],
                                isCancel: false,
                              );
                            }).toList(),
                          );
                        },
                      )
                    : StreamBuilder<QuerySnapshot>(
                        stream: orders,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }

                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }

                          return ListView(
                            children: snapshot.data!.docs
                                .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              return CardWidget(
                                name: data['name'],
                                category: data['category'],
                                isCancel: true,
                              );
                            }).toList(),
                          );
                        },
                      ),
              ),
            ),
          ]),
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
      ),
    );
  }
}
