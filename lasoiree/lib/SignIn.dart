import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lasoiree/HomePage.dart';
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
  final formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String displayName = '';
  String phoneNumber = '';
  String email = '';
  String password = '';
  bool isloading = false;
  TextEditingController displayNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController mailController = TextEditingController();
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
                Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            validator: (value) => (value!.isEmpty)
                                ? ' Please enter username'
                                : null,
                            controller: displayNameController,
                            decoration: InputDecoration(
                              labelText: 'Please Enter Your Username',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            validator: (value) => (value!.isEmpty)
                                ? ' Please enter phone number'
                                : null,
                            controller: phoneNumberController,
                            decoration: InputDecoration(
                              labelText: 'Please Enter Your phone number',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              email = value.toString().trim();
                            },
                            validator: (value) =>
                                (value!.isEmpty) ? ' Please enter email' : null,
                            controller: mailController,
                            decoration: InputDecoration(
                              labelText: 'Please Enter Your Email',
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
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
                              labelText: 'Enter Password',
                            ),
                          ),
                        ),
                        Container(
                            height: 80,
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Colors.pink[300],
                              child: Text(
                                'Sign In',
                                style: TextStyle(fontSize: 20),
                              ),
                              onPressed: () async {
                                if (formkey.currentState!.validate()) {
                                  setState(() {
                                    isloading = true;
                                  });

                                  try {
                                    UserCredential result = await _auth
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.blueGrey,
                                        content: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                              'Sucessfully Register.You Can Login Now'),
                                        ),
                                        duration: Duration(seconds: 5),
                                      ),
                                    );
                                    Navigator.of(context).pop();

                                    setState(() {
                                      isloading = false;
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title:
                                            Text(' Ops! Registration Failed'),
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
                                  }
                                  setState(() {
                                    isloading = false;
                                  });
                                }
                              },
                            )),
                      ],
                    ))
              ]),
            ),
    );
  }
}
