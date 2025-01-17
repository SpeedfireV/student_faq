
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: Text("SCAN QR")),
          TextField(decoration: InputDecoration(hintText: "SESSION CODE")),
          TextButton(onPressed: () {}, child: Text("JOIN")),
        ],
      ),
    );
  }
}
