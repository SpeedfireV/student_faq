import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({super.key});

  @override
  State<MySearchBar> createState() => My_SearchBarState();
}

class My_SearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          fillColor: ColorPalette.snowWhiteColor,
          border: OutlineInputBorder(),
          hintText: "Wyszukaj Przedmiot",
          suffixIcon: Icon(Icons.search)),
    );
  }
}
