import 'package:flutter/material.dart';
import 'package:student_faq/consts/styles/button_styles.dart';
import 'package:student_faq/consts/styles/text_styles.dart';

import '../consts/color_palette.dart';
import '../router.dart';

class PrimaryElevatedButton extends StatefulWidget {
  const PrimaryElevatedButton(
      {super.key, required this.function, required this.text});
  final VoidCallback function;
  final String text;

  @override
  State<PrimaryElevatedButton> createState() => _PrimaryElevatedButtonState();
}

class _PrimaryElevatedButtonState extends State<PrimaryElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.function,
      style: ButtonStyles.primaryElevatedButton,
      child: Text(
        widget.text,
        style: TextStyles.buttonText,
      ),
    );
  }
}

class OpenDrawerButton extends StatelessWidget {
  const OpenDrawerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return FloatingActionButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          heroTag: "sideBar",
          child: Icon(
            Icons.menu,
            color: ColorPalette.snowWhiteColor,
          ));
    });
  }
}

class CustomBackButton extends StatefulWidget {
  const CustomBackButton({super.key});

  @override
  State<CustomBackButton> createState() => _CustomBackButtonState();
}

class _CustomBackButtonState extends State<CustomBackButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          MyRouter.router.pop();
        },
        heroTag: "backButton",
        child: Icon(
          Icons.arrow_back,
          color: ColorPalette.snowWhiteColor,
        ));
  }
}

class TextIconButton extends StatelessWidget {
  const TextIconButton(
      {required this.function,
      required this.text,
      required this.icon,
      super.key});
  final VoidCallback function;
  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: function,
      label: Text(text),
      icon: icon,
      style:
          TextButton.styleFrom(foregroundColor: ColorPalette.darkOrangeColor),
    );
  }
}
