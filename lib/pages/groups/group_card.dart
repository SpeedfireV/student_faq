import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/router.dart';

import '../../models/group/group_model.dart';

class GroupCard extends StatelessWidget {
  const GroupCard({super.key, required this.group, required this.groupId});
  final Group group;
  final String groupId;

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
                MyRouter.router.pushNamed("meetings", pathParameters: {"groupId": groupId});
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      group.name,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
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
