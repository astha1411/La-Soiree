import 'package:flutter/material.dart';
import 'package:lasoiree/Categories/categories.dart';
import 'package:lasoiree/Planners&Organizers/Planners&Organizers.dart';
import 'package:lasoiree/Food&Caterers/FoodCaterers.dart';
import 'package:lasoiree/orders/orderspage.dart';
import 'package:lasoiree/mychats.dart';
import 'package:lasoiree/profile.dart';
import 'package:lasoiree/Login.dart';
import 'package:lasoiree/Decorations/RentDecorations.dart';
import 'package:lasoiree/Decorations/Decorations.dart';
import 'Cakes&Desserts/CakesDesserts.dart';
import 'Photography&Video/PhotographyVideo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

_signOut() async {
  await _firebaseAuth.signOut();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var user = FirebaseAuth.instance.currentUser;

  // void initState() {
  //   super.initState();
  //   initUser();
  // }

  // initUser() async {
  //   user = await _auth.currentUser();
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: Colors.pink[50],
          iconTheme: IconThemeData(
            color: Colors.black54,
          ),
          floating: true,
          pinned: true,
          snap: false,
          centerTitle: true,
          title: Text(
            'La Soiree',
            style: TextStyle(color: Colors.black, fontSize: 40),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.pink[300],
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OrdersPage();
                }));
              },
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              width: double.infinity,
              height: 40,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for vendors, planners',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
              child: Text(
                'We plan quicker than you think....',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 35),
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Text(
                'Want to plan a part or event?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PlannersOrganizers(table: 'planners');
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://img4.goodfon.com/wallpaper/big/8/29/pink-glitter-bokeh-background-rozovyi-fon-boke-blesk.jpg'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "Hire A Planner",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Categories();
                      }));
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(40, 40, 40, 40),
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://media.istockphoto.com/photos/violet-abstract-glitter-background-with-bokeh-lights-blurry-soft-pink-picture-id905148440?k=20&m=905148440&s=170667a&w=0&h=VHl8Gnvs74PyyRKwK3P4lCOZXKFW2rGDygvEI2qA6rw='),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "I'll Plan Myself!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ]),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              height: 50,
              child: Text(
                'Explore All Vendors',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
                height: 120,
                margin: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.pink[200],
                              ),
                              width: 100,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              child: Text(
                                "Cakes & Desserts",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return CakesDesserts();
                              }));
                            },
                          ),
                          Positioned(
                            left: 35,
                            bottom: 75,
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: new NetworkImage(
                                          "https://food.fnr.sndimg.com/content/dam/images/food/fullset/2009/4/5/1/IG1C17_30946_s4x3.jpg.rend.hgtvcom.616.462.suffix/1433541424559.jpeg"),
                                      fit: BoxFit.cover)),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.pink[200],
                                ),
                                width: 100,
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.all(8),
                                alignment: Alignment.center,
                                child: Text(
                                  'Food & Caterers',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return FoodCaterers();
                                }));
                              }),
                          Positioned(
                            left: 35,
                            bottom: 75,
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: new NetworkImage(
                                          "https://i.pinimg.com/originals/b0/fa/29/b0fa2934176e7dd0abc9769c20ef7c09.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.pink[200],
                              ),
                              width: 100,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              child: Text(
                                "Photography & Video",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return PhotographyVideos();
                              }));
                            },
                          ),
                          Positioned(
                            left: 35,
                            bottom: 75,
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: new NetworkImage(
                                          "https://i.pinimg.com/550x/42/07/d4/4207d4e47b4ce40eca2e1e28f1fd2a42.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.pink[200],
                              ),
                              width: 100,
                              padding: EdgeInsets.all(5),
                              margin: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              child: Text(
                                "Balloons & Decorations",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Decorations();
                              }));
                            },
                          ),
                          Positioned(
                            left: 35,
                            bottom: 75,
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: new NetworkImage(
                                          "https://i.pinimg.com/originals/51/94/1a/51941a84b832d84eeb8ae53654436f14.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.pink[200],
                            ),
                            width: 100,
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(8),
                            alignment: Alignment.center,
                            child: Text(
                              "Bands & DJs",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                          Positioned(
                            left: 35,
                            bottom: 75,
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: new NetworkImage(
                                          "https://ae01.alicdn.com/kf/HTB1Ov4seOQnBKNjSZFmq6AApVXaS/Purple-Dj-Polka-Dot-Light-Curtain-Stage-Disco-Background-polyester-or-Vinyl-cloth-High-quality-Computer.jpg_Q90.jpg_.webp"),
                                      fit: BoxFit.cover)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              height: 50,
              child: Text(
                'Feel the buzz around you',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              height: 150,
              margin: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://ae01.alicdn.com/kf/HTB1BYshQFXXXXXvXpXXq6xXFXXXi/HUAYI-Hazy-light-photography-newborn-backdrop-dark-background-XT4705.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink[200],
                      ),
                      width: 100,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Text(
                        "Bachlorette Parties",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PlannersOrganizers(table: 'bachelorette');
                      }));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://i2.wp.com/www.weddingsutra.com/images/ms-decor-thumb-1.jpg?fit=700%2C700&ssl=1?%3E'),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink[200],
                      ),
                      width: 100,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Text(
                        "Weddings",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PlannersOrganizers(table: 'weddings');
                      }));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://www.ubuy.com.tr/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvNjFjMnBqb21TQ0wuX0FDX1NMMTIwMF8uanBn.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink[200],
                      ),
                      width: 100,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Text(
                        "Baby Showers",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PlannersOrganizers(table: 'babyshower');
                      }));
                    },
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://previews.123rf.com/images/juliannafunk/juliannafunk1607/juliannafunk160700015/62543113-colorful-birthday-cake-with-sprinkles-over-a-pink-background-.jpg'),
                          fit: BoxFit.cover,
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.5), BlendMode.dstATop),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.pink[200],
                      ),
                      width: 100,
                      padding: EdgeInsets.all(5),
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Text(
                        "Birthdays & Anniversary",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return PlannersOrganizers(table: 'birthdays');
                      }));
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              height: 50,
              child: Text(
                'Occassions made better!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0),
              height: 50,
              child: Text(
                'Rent Party Supplies',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
              InkWell(
                child: Container(
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
                            Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.pink[300]),
                  child: Text(
                    "Decor & Furnitures",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return RentDecorations();
                  }));
                },
              ),
              InkWell(
                child: Container(
                  width: double.infinity,
                  height: 100,
                  alignment: Alignment.center,
                  margin:
                      EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 10),
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'http://www.hamaraevent.com/uploads/blog/0726480001469276826.png'),
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
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return PlannersOrganizers(table: 'planners');
                  }));
                },
              ),
            ]),
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
              height: 80,
              child: Text(
                'Turning Instants into Moments...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
              ),
            ),
          ]),
        ),
      ]),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pink[100],
              ),
              accountName: Text("Hello John Doe",
                  style: TextStyle(fontSize: 20)),
              accountEmail: Text("${user?.email}"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.pink[300],
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              title: const Text('My Profile'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ProfilePage();
                }));
              },
            ),
            ListTile(
              title: const Text('Chats'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyChats();
                }));
              },
            ),
            ListTile(
              title: const Text('Rate Us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('My Orders'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return OrdersPage();
                }));
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async {
                await _signOut();
                if (_firebaseAuth.currentUser == null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }
              },
            ),
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
}
