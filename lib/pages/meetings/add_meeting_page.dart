import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/create_group_bloc/create_group_bloc.dart';
import 'package:student_faq/bloc/create_meeting_bloc/create_meeting_bloc.dart';
import 'package:student_faq/bloc/groups/groups_bloc.dart';
import 'package:student_faq/router.dart';

import '../../bloc/create_group_bloc/create_group_state.dart';

class AddMeetingPage extends StatefulWidget {
  const AddMeetingPage({super.key, required this.groupId});
  final String groupId;


  @override
  State<AddMeetingPage> createState() => _AddMeetingPageState();
}

class _AddMeetingPageState extends State<AddMeetingPage> {
  late TextEditingController meetingNameController;
  late TextEditingController meetingDescriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    meetingNameController = TextEditingController();
    meetingDescriptionController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    meetingNameController.dispose();
    meetingDescriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateMeetingBloc(),

      child: Builder(
        builder: (context) {
          return Scaffold(body: Stack(
                    children: [


                      Column(children: [
                        TextFormField(
                          controller: meetingNameController,

                          decoration: InputDecoration(
                            hintText: "Session Name"
                        ),
                        ),
                        TextFormField(
                          controller: meetingDescriptionController,
                          decoration: InputDecoration(
                            hintText: "Description"
                        ),
                        ),

                        ElevatedButton(onPressed: () {
                          BlocProvider.of<CreateMeetingBloc>(context).add(AddMeetingEvent(widget.groupId, meetingNameController.text, description: meetingDescriptionController.text));
                        }, child: Text("Submit"))

                      ],),
                      BlocConsumer<CreateMeetingBloc, CreateMeetingState>(
                          listener: (context, state) {
                            if (state is SuccessfullyAddedMeetingState) {
                              MyRouter.router.pop();
                            }
                            if (state is FailedToAddMeetingState) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.exceptionText, textAlign: TextAlign.center,),));
                            }
                          },

                          builder: (context, state) {
                        if (state is AddingMeetingState) {
                          return Container(
                            color: Colors.red.withValues(alpha: 0.3),
                            child: Center(child: CircularProgressIndicator()),
                          );
                        }
                        return Container();
                      }),
                    ],



          ),);
        }
      ),
    );
  }
}
