
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JoinSessionPage extends StatefulWidget {
  const JoinSessionPage({super.key});

  @override
  State<JoinSessionPage> createState() => _JoinSessionPageState();
}

class _JoinSessionPageState extends State<JoinSessionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: () {}, child: Text("SCAN QR")),
            TextField(decoration: InputDecoration(hintText: "SESSION CODE")),
            TextButton(onPressed: () {}, child: Text("JOIN")),
          ],
        ),
      ),
    );
  }
}
