import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lasoiree/HomePage.dart';
import 'package:lasoiree/SignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool isloading = false;

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
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.all(0),
              child: ListView(children: <Widget>[
                Container(
                  height: 170,
                  decoration: new BoxDecoration(color: Colors.pink[200]),
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Column(children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Sign in to continue',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ]),
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Email";
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Email',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter Password";
                            }
                          },
                          onChanged: (value) {
                            password = value;
                          },
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                          ),
                        ),
                      ),
                      FlatButton(
                        onPressed: () {
                          //forgot password screen
                        },
                        textColor: Colors.pink[100],
                        child: Text('Forgot Password'),
                      ),
                      Container(
                        height: 50,
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.pink[300],
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                          onPressed: () async {
                            if (formkey.currentState!.validate()) {
                              setState(() {
                                isloading = true;
                              });
                              try {
                                await _auth.signInWithEmailAndPassword(
                                    email: email, password: password);

                                await Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(),
                                  ),
                                );

                                setState(() {
                                  isloading = false;
                                });
                              } on FirebaseAuthException catch (e) {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text("Oops! Login Failed"),
                                    content: Text('${e.message}'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Text('Okay'),
                                      )
                                    ],
                                  ),
                                );
                                print(e);
                              }
                              setState(() {
                                isloading = false;
                              });
                            }
                          },
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Text('Do not have account?'),
                            FlatButton(
                              textColor: Colors.pink[200],
                              child: Text(
                                'Sign in',
                                style: TextStyle(fontSize: 18),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignIn()),
                                );
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
    );
  }
}
