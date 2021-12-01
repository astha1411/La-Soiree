import 'package:flutter/material.dart';
import 'package:lasoiree/AppBar/appbar.dart';
import 'package:lasoiree/orders/data/previousorders.dart';
import 'package:lasoiree/orders/data/currentorders.dart';
import 'package:lasoiree/orders/cards.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  List currdata = CurrentOrders.getData;
  List prevdata = PreviousOrders.getData;
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
          body: Column(
            children: [
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
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 50,
                      );
                    },
                    itemCount: 3,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index) {
                      return isPrev
                          ? CardWidget(
                              name: prevdata[index]['name'],
                              category: prevdata[index]['category'],
                              isCancel: false,
                            )
                          : CardWidget(
                              name: currdata[index]['name'],
                              category: currdata[index]['category'],
                              isCancel: true,
                            );
                    }),
              ))
            ],
          )),
    );
  }
}
