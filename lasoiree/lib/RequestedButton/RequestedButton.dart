import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class RequestButton extends StatefulWidget {
  @override
  _RequestButtonState createState() => _RequestButtonState();
}

class _RequestButtonState extends State<RequestButton> {
  late bool isRequested;

  @override
  void initState() {
    isRequested = false;
  }

  void setRequested() {
    setState(() {
      isRequested = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      color: Colors.pink[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Text(
        isRequested ? "Requested" : "Request Info",
        style: TextStyle(fontSize: 15),
      ),
      //  onPressed: ()=>{},
      onPressed: isRequested ? null : setRequested,
    );
  }
}
