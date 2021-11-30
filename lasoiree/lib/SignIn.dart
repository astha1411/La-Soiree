import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lasoiree/main1.dart';
import 'package:lasoiree/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignIn(),
    );
  }
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Container(
            height: 0.2,
          ),
          elevation: 0,
        ),
        body: Padding(
            padding: EdgeInsets.all(0),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 170,
                  decoration: new BoxDecoration(color: Colors.pink[200]),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Create new Account',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                        child: Row(
                      children: <Widget>[
                        Text(
                          'Already registered?',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                          textAlign: TextAlign.center,
                        ),
                        FlatButton(
                          textColor: Colors.white,
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 15),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                            );
                          },
                        )
                      ],
                      mainAxisAlignment: MainAxisAlignment.center,
                    )),
                  ]),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Please Enter Your Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  child: TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                      labelText: 'Please Enter Your Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Password',
                    ),
                  ),
                ),
                Container(
                    height: 80,
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: RaisedButton(
                      textColor: Colors.white,
                      color: Colors.pink[200],
                      child: Text(
                        'Signin',
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                    )),
              ],
            )));
  }
}
