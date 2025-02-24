import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/consts/styles/text_styles.dart';
import 'package:student_faq/pages/responses/response_card.dart';
import 'package:student_faq/input_bar.dart';
import 'package:student_faq/router.dart';

class ResponsesPage extends StatefulWidget {
  const ResponsesPage({super.key});

  @override
  State<ResponsesPage> createState() => _ResponsesPageState();
}

class _ResponsesPageState extends State<ResponsesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                        onPressed: () {
                          MyRouter.router.pop();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: ColorPalette.snowWhiteColor,
                        ),
                        heroTag: "sideBar"),
                    Expanded(child: Container()),
                    Text("ODPOWIEDZI", style: TextStyles.pageTitle),
                    Expanded(child: Container()),
                  ],
                ),
                SizedBox(height: 16),
                Text("PYTANIE"),
                ResponseCard(),
                Divider(
                  thickness: 2,
                  color: ColorPalette.brown,
                  height: 32,
                ),
                ResponseCard(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Align(
                  alignment: Alignment.bottomCenter, child: InputBar("Odpowiedz")),
            )
          ],
        ),
      )),
    );
  }
}
