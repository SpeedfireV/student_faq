import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/create_group_bloc/create_group_bloc.dart';
import 'package:student_faq/bloc/create_group_bloc/create_group_event.dart';
import 'package:student_faq/bloc/create_group_bloc/create_group_state.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/models/group/group_model.dart';
import 'package:student_faq/router.dart';

import '../../widgets/buttons.dart';

class AddGroupPage extends StatefulWidget {
  const AddGroupPage({super.key});

  @override
  State<AddGroupPage> createState() => _AddGroupPageState();
}

class _AddGroupPageState extends State<AddGroupPage> {
  late TextEditingController groupController;
  late TextEditingController descriptionController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    groupController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    groupController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateGroupBloc(),
      child: Builder(builder: (context) {
        return BlocConsumer<CreateGroupBloc, CreateGroupState>(
            listener: (context, state) {
          if (state is CreateGroupUnsuccessful) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              state.exception.message ?? "Error Occured",
              textAlign: TextAlign.center,
            )));
          } else if (state is CreateGroupError) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
              state.exception.toString(),
              textAlign: TextAlign.center,
            )));
          } else if (state is CreateGroupSuccessful) {
            MyRouter.router.pop();
          }
        }, builder: (context, state) {
          return Scaffold(
            body: SafeArea(
                child: Stack(
              children: [
                Column(
                  children: [
                    TextField(
                      controller: groupController,
                      decoration: const InputDecoration(
                        hintText: "Nazwa Grupy",
                      ),
                    ),
                    TextField(
                      controller: descriptionController,
                      decoration: const InputDecoration(
                        hintText: "Opis Grupy",
                      ),
                    ),
                    PrimaryElevatedButton(
                        function: () async {
                          BlocProvider.of<CreateGroupBloc>(context).add(
                              CreateGroupSubmitForm(Group(
                                  name: groupController.text,
                                  description: descriptionController.text)));
                        },
                        text: "Join Using Code")
                  ],
                ),
                state is CreateGroupParsing
                    ? Expanded(
                        child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: ColorPalette.lightBlue.withOpacity(0.5),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: ColorPalette.brown,
                          ),
                        ),
                      ))
                    : Container()
              ],
            )),
          );
        });
      }),
    );
  }
}
