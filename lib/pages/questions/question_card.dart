import 'package:flutter/material.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/models/question/question_model.dart';
import 'package:student_faq/router.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
    required this.groupId,
    required this.meetingId,
    this.onLike,
    this.isLiking = false,
    this.clickable = true,
  });

  final Question question;
  final String groupId;
  final String meetingId;
  final VoidCallback? onLike;
  final bool isLiking;
  final bool clickable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: clickable ? 5 : 0,
        color: ColorPalette.snowWhiteColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: clickable ? () {
            MyRouter.router.pushNamed(
              Routes.responses.name,
              pathParameters: {
                "groupId": groupId,
                "meetingId": meetingId,
                "questionId": question.uid ?? "",
              },
              extra: question,
            );
          }: null,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Anonymous User",
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 4),

                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "0", // TODO: Add likes count to Question model
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          onPressed: isLiking ? null : onLike,
                          icon: isLiking
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                  ),
                                )
                              : Icon(
                                  Icons.thumb_up_outlined,
                                  color: ColorPalette.buttonBackgroundColor,
                                ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  question.questionName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.reply, size: 20),
                    const SizedBox(width: 4),
                    Text(
                      "${question.answersCount} ${question.answersCount == 1 ? 'Answer' : 'Answers'}",
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
