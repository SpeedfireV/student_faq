import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';

class ResponseCard extends StatefulWidget {
  const ResponseCard({super.key});

  @override
  State<ResponseCard> createState() => _ResponseCardState();
}

class _ResponseCardState extends State<ResponseCard> {
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
                              "Anonymous Goose",
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
                            Text("5"),
                            SizedBox(width: 8),
                            Icon(
                              Icons.thumb_up_outlined,
                              color: ColorPalette.buttonBackgroundColor,
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Czy 2+2 to 4?",
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
