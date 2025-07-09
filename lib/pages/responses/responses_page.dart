import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/responses/responses_bloc.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/consts/styles/text_styles.dart';
import 'package:student_faq/models/answer/answer_model.dart';
import 'package:student_faq/models/question/question_model.dart';
import 'package:student_faq/pages/responses/response_card.dart';
import 'package:student_faq/input_bar.dart';
import 'package:student_faq/router.dart';

import '../questions/question_card.dart';

class ResponsesPage extends StatefulWidget {
  const ResponsesPage(
      {super.key,
      required this.groupId,
      required this.meetingId,
      required this.questionId,
      required this.question});

  final String groupId;
  final String meetingId;
  final String questionId;
  final Question question;

  @override
  State<ResponsesPage> createState() => _ResponsesPageState();
}

class _ResponsesPageState extends State<ResponsesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResponsesBloc(),
      child: Scaffold(
        body: SafeArea(child: Builder(builder: (context) {
          BlocProvider.of<ResponsesBloc>(context).add(
            FetchResponsesEvent(
              widget.groupId,
              widget.meetingId,
              widget.questionId,
            ),
          );
          return Padding(
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
                            heroTag: "sideBar",
                            child: Icon(
                              Icons.arrow_back,
                              color: ColorPalette.snowWhiteColor,
                            )),
                        Expanded(child: Container()),
                        Text("ODPOWIEDZI", style: TextStyles.pageTitle),
                        Expanded(child: Container()),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text("PYTANIE"),
                    SizedBox(
                      height: 8,
                    ),
                  QuestionCard(question: widget.question, groupId: widget.groupId, meetingId: widget.meetingId, clickable: false),
                    Divider(
                      thickness: 2,
                      color: ColorPalette.brown,
                      height: 24,
                    ),
                    Expanded(
                      child: BlocBuilder<ResponsesBloc, ResponsesState>(
                        builder: (context, state) {
                          if (state is FetchingResponsesState) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is ResponsesLoaded) {
                            final responses =
                                BlocProvider.of<ResponsesBloc>(context)
                                    .alreadyFetchedAnswers;
                            final itemCount = responses.length;
                            return ListView(

                              children: [ListView.separated(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return ResponseCard(answer: responses[index]);
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(height: 16);
                                  },
                                  itemCount: itemCount),
                              SizedBox(height: 100)]
                            );
                          } else if (state is ResponsesError) {
                            return Center(
                              child: Text(state.errorMessage),
                            );
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InputBar("Odpowiedz", onSend: (text) {

                        BlocProvider.of<ResponsesBloc>(context).add(AddResponseEvent(widget.groupId, widget.meetingId, widget.questionId, Answer(author: "Author", questionContents: text, dateTime: DateTime.now())));
                      })),
                )
              ],
            ),
          );
        })),
      ),
    );
  }
}
