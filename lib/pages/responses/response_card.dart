import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/models/answer/answer_model.dart';
import 'package:student_faq/models/question/question_model.dart';

class ResponseCard extends StatelessWidget {
  const ResponseCard({super.key, required this.answer});
  final Answer answer;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Expanded(
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 0,
              color: ColorPalette.snowWhiteColor,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              answer.author,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                Icon(false
                                    ? Icons.attach_file
                                    : Icons
                                        .attach_file_sharp), // TODO: Add file off
                                Text("Brak Załączników",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text("5"),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.thumb_up_outlined,
                              color: ColorPalette.buttonBackgroundColor,
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      answer.questionContents,
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
