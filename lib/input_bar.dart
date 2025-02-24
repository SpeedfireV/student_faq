import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';

class InputBar extends StatefulWidget {
  const InputBar(this.text, {super.key});
  final String text;
  @override
  State<InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          fillColor: ColorPalette.snowWhiteColor,
          border: OutlineInputBorder(),
          hintText: widget.text,
          prefixIcon: IconButton(onPressed: () {}, icon:Icon(Icons.attach_file)),
          suffixIcon: IconButton(onPressed: () {}, icon:Icon(Icons.send)),
    ));
  }
}
