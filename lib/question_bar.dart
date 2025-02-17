import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';

class QuestionBar extends StatefulWidget {
  const QuestionBar({super.key});

  @override
  State<QuestionBar> createState() => _QuestionBarState();
}

class _QuestionBarState extends State<QuestionBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          fillColor: ColorPalette.snowWhiteColor,
          border: OutlineInputBorder(),
          hintText: "Zadaj Pytanie",
          prefixIcon: Icon(Icons.attach_file),
          suffixIcon: Icon(Icons.send)),
    );
  }
}
