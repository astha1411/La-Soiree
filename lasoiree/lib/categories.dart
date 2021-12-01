import 'package:flutter/material.dart';
import 'package:lasoiree/planners_and_organizations/widgets/cards.dart';
import 'package:lasoiree/planners_and_organizations/data.dart';
import 'package:lasoiree/Appbar/appbar.dart';



class PlannersPage extends StatelessWidget {
  List data = PlannersData.getData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Mini Project',
      home: Scaffold(
        backgroundColor: Colors.pink.shade50,
        appBar:
            AppBarWidget(title: 'Planners & Organizers', backgroundColor : Colors.white,),
        body:
Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
              Container(
                width: double.infinity,
                height: 100,
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 10),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://m.media-amazon.com/images/I/716IOaeXW6L._SY355_.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.4), BlendMode.dstATop),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.pink[300]),
                child: Text(
                  "Decor & Furniture",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 10),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://prestigiousvenues.com/wp-content/uploads/2017/03/Birthday-Party-On-The-Beach-Round-Hill-Resort-Prestigious-Venues.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.pink[300]),
                child: Text(
                  "Venues",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                alignment: Alignment.center,
                margin:
                    EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 10),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://previews.123rf.com/images/essentialimagemedia/essentialimagemedia1605/essentialimagemedia160500020/58634836-high-end-table-setting-with-fine-cutlery-glassware-and-crockery.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: new ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.pink[300]),
                child: Text(
                  "Crockery & Others",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
              )
            ]),
            