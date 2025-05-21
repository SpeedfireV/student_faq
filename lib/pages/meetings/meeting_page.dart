import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/consts/styles/text_styles.dart';
import 'package:student_faq/input_bar.dart';
import 'package:student_faq/models/meeting/meeting_model.dart';
import 'package:student_faq/router.dart';

import '../../bloc/meetings/meetings_bloc.dart';
import '../../widgets/buttons.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage({super.key, required this.groupId, required this.meetingId});
  final String groupId;
  final String meetingId;


  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      const CustomBackButton(),
                      Expanded(child: Container()),
                      Text("SPOTKANIE", style: TextStyles.pageTitle),
                      Expanded(child: Container()),
                    ],
                  ),
                  SizedBox(height: 32),
                  Flexible(
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
                                MyRouter.router
                                    .pushNamed(Routes.responses.name, pathParameters: {"groupId": widget.groupId, "meetingId": widget.meetingId});
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Anonymous Goose",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w400),
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
                                                        fontWeight:
                                                            FontWeight.w300)
                                                ),
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
                                              color: ColorPalette
                                                  .buttonBackgroundColor,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Text(
                                      "Czy 2+2 to 4?",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Divider(
                                      thickness: 2,
                                      color: ColorPalette.brown,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            "Karol Styka (Prowadzący): 2 + 2 to 4."),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("5"),
                                            SizedBox(width: 8),
                                            Icon(
                                              Icons.thumb_up_outlined,
                                              color: ColorPalette
                                                  .buttonBackgroundColor,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 16),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.reply),
                                        Text("5 Odpowiedzi"),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: InputBar("Zapytaj", sendFunction: () {},)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
