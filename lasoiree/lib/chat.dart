import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage(
      {@required this.messageContent = '', @required this.messageType = ''});
}

List<ChatMessage> messages = [
  ChatMessage(messageContent: "Hello, John", messageType: "receiver"),
  ChatMessage(
      messageContent: "How many brownies do you need?",
      messageType: "receiver"),
  ChatMessage(
      messageContent: "Hey Matt, I'd like 100 brownies by tomorrow.",
      messageType: "sender"),
  ChatMessage(
      messageContent: "What flavour would you like to order?",
      messageType: "receiver"),
  ChatMessage(messageContent: "Chocolate", messageType: "sender"),
  ChatMessage(messageContent: "Okay, what time?", messageType: "receiver"),
  ChatMessage(
      messageContent: "5 pm would be great, thank you!", messageType: "sender"),
];

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final newMessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[50],
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text("Chats", style: TextStyle(color: Colors.black)),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Container(
              child: Card(
                color: Colors.pink[100],
                child: ListTile(
                  title: Text(
                    "Brownie Point",
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
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 70, bottom: 60),
                  child: ListView.builder(
                    itemCount: messages.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.only(bottom: 10),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            left: 14, right: 14, top: 10, bottom: 10),
                        child: Align(
                          alignment: (messages[index].messageType == "receiver"
                              ? Alignment.topLeft
                              : Alignment.topRight),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: (messages[index].messageType == "receiver"
                                  ? Colors.grey.shade200
                                  : Colors.pink[50]),
                            ),
                            padding: EdgeInsets.all(16),
                            child: Text(
                              messages[index].messageContent,
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.pink[300],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            controller: newMessageController,
                            decoration: InputDecoration(
                                hintText: "Write message...",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          child: IconButton(
                            icon: Icon(Icons.send),
                            onPressed: sendMessage,
                            color: Colors.white,
                            iconSize: 18,
                          ),
                          backgroundColor: Colors.pink[300],
                          elevation: 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage() {
    setState(() {
      messages.add(ChatMessage(
          messageContent: newMessageController.text, messageType: "sender"));
    });
    newMessageController.text = "";
    Future.delayed(const Duration(milliseconds: 2300), () {
// Here you can write your code

      setState(() {
        messages.add(ChatMessage(
            messageContent: "Yes, we just got it packed!",
            messageType: "receiver"));
        // Here you can  write your code for open new view
      });
    });
  }
}
