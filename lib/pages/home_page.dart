import 'package:flutter/material.dart';
import 'package:student_faq/router.dart';
import 'package:student_faq/widgets/pages_drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(drawer: PagesDrawer());
  }
}
