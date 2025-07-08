import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/router.dart';
import 'package:student_faq/widgets/buttons.dart';
import 'package:student_faq/widgets/pages_drawer.dart';

import '../consts/styles/button_styles.dart';
import '../consts/styles/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const PagesDrawer(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const OpenDrawerButton(),
                Expanded(child: Container()),
                Text(
                  "STRONA GŁÓWNA",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Expanded(child: Container()),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              "GRUPY",
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.brown),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.login,
                color: ColorPalette.brown,
                size: 36,
              ),
              label: Text(
                "DOŁĄCZ DO GRUPY",
                style: TextStyles.whiteButtonText,
              ),
              style: ButtonStyles.whitePrimaryElevatedButton,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.login,
                color: ColorPalette.brown,
                size: 36,
              ),
              label: Text(
                "UTWÓRZ GRUPĘ",
                style: TextStyles.whiteButtonText,
              ),
              style: ButtonStyles.whitePrimaryElevatedButton,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.login,
                color: ColorPalette.brown,
                size: 36,
              ),
              label: Text(
                "DODAJ UCZELNIĘ",
                style: TextStyles.whiteButtonText,
              ),
              style: ButtonStyles.whitePrimaryElevatedButton,
            ),
            const SizedBox(height: 32),
            Text(
              "SPOTKANIA",
              style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w600,
                  color: ColorPalette.brown),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.login,
                color: ColorPalette.brown,
                size: 36,
              ),
              label: Text(
                "DOŁĄCZ DO SPOTKANIA",
                style: TextStyles.whiteButtonText,
              ),
              style: ButtonStyles.whitePrimaryElevatedButton,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.login,
                color: ColorPalette.brown,
                size: 36,
              ),
              label: Text(
                "UTWÓRZ SPOTKANIE",
                style: TextStyles.whiteButtonText,
              ),
              style: ButtonStyles.whitePrimaryElevatedButton,
            )
          ],
        ),
      )),
    );
  }
}
