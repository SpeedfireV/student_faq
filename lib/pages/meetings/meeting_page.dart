import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/questions/questions_bloc.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/consts/styles/text_styles.dart';
import 'package:student_faq/input_bar.dart';
import 'package:student_faq/models/meeting/meeting_model.dart';
import 'package:student_faq/models/question/question_model.dart';
import 'package:student_faq/pages/meetings/meeting_card.dart';
import 'package:student_faq/pages/meetings/question_card.dart';
import 'package:student_faq/router.dart';
import 'package:student_faq/services/database_service.dart';

import '../../bloc/meetings/meetings_bloc.dart';
import '../../widgets/buttons.dart';

class MeetingPage extends StatefulWidget {
  const MeetingPage(
      {super.key, required this.groupId, required this.meetingId});
  final String groupId;
  final String meetingId;

  @override
  State<MeetingPage> createState() => _MeetingPageState();
}

class _MeetingPageState extends State<MeetingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => QuestionsBloc(),
          child: Builder(builder: (context) {
            BlocProvider.of<QuestionsBloc>(context).add(
              FetchMoreQuestionsEvent(widget.groupId, widget.meetingId),
            );
            return Padding(
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
                      const SizedBox(height: 32),
                      Expanded(
                        child: BlocBuilder<QuestionsBloc, QuestionsState>(
                          builder: (context, state) {
                            if (state is FetchingQuestionsState) {
                              Center(child: CircularProgressIndicator());
                            } else if (state is QuestionsLoaded) {
                              return ListView(
                                children: [
                                  ListView.builder(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return QuestionCard(
                                        question:
                                            BlocProvider.of<QuestionsBloc>(context)
                                                .alreadyFetchedQuestions[index],
                                        groupId: widget.groupId,
                                        meetingId: widget.meetingId,
                                      );
                                    },
                                    itemCount:
                                        BlocProvider.of<QuestionsBloc>(context)
                                            .alreadyFetchedQuestions
                                            .length,
                                  ),
                                  SizedBox(height: 100)
                                ],
                              );
                            }
                            return Center(child: CircularProgressIndicator());
                          },
                        ),
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: BlocBuilder<QuestionsBloc, QuestionsState>(
                          builder: (context, state) {
                            return InputBar(
                              "Zapytaj",
                              onSend: (text) {
                                if (state is QuestionsLoading) {
                                  return;
                                }
                                BlocProvider.of<QuestionsBloc>(context).add(
                                    AddQuestionEvent(
                                        widget.groupId,
                                        widget.meetingId,
                                        Question(
                                            questionName: text,
                                            dateTime: DateTime.now())));
                              },
                            );
                          },
                        )),
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
