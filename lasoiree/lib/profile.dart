import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lasoiree/Login.dart';
import 'package:lasoiree/SignIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

_signOut() async {
  await _firebaseAuth.signOut();
}

class _ProfilePageState extends State<ProfilePage> {
  var user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          leading: BackButton(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0.0,
          title: Text("My Profile", style: TextStyle(color: Colors.black)),
          centerTitle: true,
        ),
        body: Container(
          alignment: AlignmentDirectional(0.0, 0.0),
          color: Colors.white,
          margin: new EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: Card(
                  color: Colors.pink[100],
                  child: ListTile(
                    title: Text(
                      "User Details",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              CircleAvatar(
                radius: 45,
                backgroundImage: NetworkImage(
                    'https://cdn.pixabay.com/photo/2017/06/13/12/54/profile-2398783_1280.png'),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                "John Doe",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                child: Text(
                  'Email',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(40, 10, 0, 10),
                child: Text(
                  "${user?.email}",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                child: Text(
                  'Contact',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                height: 40,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.fromLTRB(40, 10, 0, 10),
                child: Text(
                  "9876543210",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.pink[100],
                    child: Text('Logout'),
                    onPressed: () async {
                      await _signOut();
                      if (_firebaseAuth.currentUser == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      }
                    }),
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: Text(
                  'Reach out to us at',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.facebook,
                    size: 40,
                  ),
                  Icon(
                    FontAwesomeIcons.twitter,
                    size: 40,
                  ),
                  Icon(
                    FontAwesomeIcons.instagram,
                    size: 40,
                  ),
                  Icon(
                    FontAwesomeIcons.globe,
                    size: 40,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
