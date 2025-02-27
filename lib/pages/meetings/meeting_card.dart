import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/router.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Row(
        children: [
          Expanded(
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              color: ColorPalette.snowWhiteColor,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  MyRouter.router.push("/meetings/meeting");
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Podstawy Informatyki i Programowania 5",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "08:15-",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Podstawy Informatyki i Programowania (PIPR)",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w300),
                      ),
                      Text("Andrzej Kowal, Justyna Krzak",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300)),
                      SizedBox(height: 16),
                      Text(
                        "Wykład",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
