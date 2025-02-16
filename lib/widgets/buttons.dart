import 'package:flutter/material.dart';
import 'package:student_faq/consts/styles/button_styles.dart';
import 'package:student_faq/consts/styles/text_styles.dart';

class PrimaryElevatedButton extends StatefulWidget {
  const PrimaryElevatedButton({super.key, this.function, required this.text});
  final VoidCallback? function;
  final String text;

  @override
  State<PrimaryElevatedButton> createState() => _PrimaryElevatedButtonState();
}

class _PrimaryElevatedButtonState extends State<PrimaryElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.function,
      child: Text(
        widget.text,
        style: TextStyles.buttonText,
      ),
      style: ButtonStyles.primaryElevatedButton,
    );
  }
}
