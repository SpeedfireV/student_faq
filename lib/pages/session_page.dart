
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SessionPage extends StatefulWidget {
  const SessionPage({super.key});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Text("Message"),
          TextField(decoration: InputDecoration(hintText: "Question"),),
        ],),
      ),
    );
  }
}
