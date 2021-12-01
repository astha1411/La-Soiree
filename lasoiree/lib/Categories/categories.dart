import 'package:flutter/material.dart';
import 'cards.dart';
import 'package:lasoiree/Appbar/appbar.dart';
import 'package:lasoiree/Cakes&Desserts/CakesDesserts.dart';
import 'package:lasoiree/Decorations/Decorations.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Mini Project',
        home: Scaffold(
            backgroundColor: Colors.pink.shade50,
            appBar: AppBarWidget(
              title: 'Categories',
              backgroundColor: Colors.white,
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CardWidget(
                      name: 'Cakes & Desserts',
                      route: CakesDesserts(),
                      image:
                          'https://c4.wallpaperflare.com/wallpaper/961/360/885/colorful-cream-cakes-pastries-sweet-food-wallpaper-preview.jpg'),
                  CardWidget(
                      name: 'Food & Caterers',
                      route: CakesDesserts(),
                      image:
                          'https://images.chinahighlights.com/allpicture/2015/10/a09e1fd5fe6247a299ba5b4e_cut_800x500_9.jpg'),
                  CardWidget(
                      name: 'Photographers & Video',
                      route: CakesDesserts(),
                      image:
                          'https://images.thequint.com/thequint%2F2021-10%2F554046dc-69d2-4c01-8ac2-e699b9ad43c5%2FUntitled_design__94_.png'),
                  CardWidget(
                      name: 'Balloons & Decorations',
                      route: Decorations(),
                      image:
                          'https://cdn.fcglcdn.com/brainbees/images/products/zoom/8065149a.jpg'),
                  CardWidget(
                      name: 'Bands & DJs',
                      route: Decorations(),
                      image:
                          'https://cdn-az.allevents.in/events7/banners/2d8b4b2ed205a044f0ad72323c4048d7650933e97f66eac3cfd4b4daf41b1792-rimg-w1200-h800-gmir.jpg?v=1636950215'),
                ])));
  }
}
