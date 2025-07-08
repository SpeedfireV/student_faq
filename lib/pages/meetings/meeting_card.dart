import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/models/meeting/meeting_model.dart';
import 'package:student_faq/router.dart';
import 'package:student_faq/utils/utils.dart';

class MeetingCard extends StatelessWidget {
  const MeetingCard({super.key, required this.meeting});
  final Meeting meeting;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Material(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 5,
            color: ColorPalette.snowWhiteColor,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                MyRouter.router.pushNamed(Routes.meeting.name, pathParameters: {
                  "groupId": meeting.groupUid!,
                  "meetingId": meeting.uid!
                });
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      meeting.sessionName,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.alarm),
                        SizedBox(width: 4),
                        Text(
                          Utils.getTimeString(meeting.creationDate) +
                              " - " +
                              (meeting.endDate == null
                                  ? "ongoing"
                                  : Utils.getTimeString(meeting.endDate!)),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    meeting.description != null
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(meeting.description!,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300)),
                              SizedBox(height: 16),
                            ],
                          )
                        : Container(),
                    // Text(
                    //   "Wykład",
                    //   style: TextStyle(
                    //       fontSize: 16, fontWeight: FontWeight.w400),
                    // )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
