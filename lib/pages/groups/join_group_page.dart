import 'package:flutter/material.dart';
import 'package:student_faq/consts/styles/button_styles.dart';
import 'package:student_faq/consts/styles/text_styles.dart';
import 'package:student_faq/widgets/buttons.dart';

import '../../consts/color_palette.dart';

class JoinGroupPage extends StatefulWidget {
  const JoinGroupPage({super.key});

  @override
  State<JoinGroupPage> createState() => _JoinGroupPageState();
}

class _JoinGroupPageState extends State<JoinGroupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                const CustomBackButton(),
                Expanded(child: Container()),
                Text("TWOJE GRUPY", style: TextStyles.pageTitle),
                Expanded(child: Container()),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextField(
                    decoration: InputDecoration(
                        hintText: "Kod Grupy", border: OutlineInputBorder()),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyles.primaryElevatedButton,
                    child: Text(
                      "Dołącz Do Grupy",
                      style: TextStyles.orangeButtonText,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("LUB"),
                  const SizedBox(height: 16),
                  ElevatedButton.icon(
                    onPressed: () {},
                    label:
                        Text("Dołącz z QR", style: TextStyles.orangeButtonText),
                    icon: const Icon(
                      Icons.qr_code,
                      size: 40,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
