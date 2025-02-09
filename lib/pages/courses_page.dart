import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/usos_authentication/usos_authentication_bloc.dart';
import 'package:student_faq/router.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsosAuthenticationBloc, UsosAuthenticationState>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                MyRouter.router.go("/main_page/join_session");
              },
              heroTag: "joinSession",
              child: Icon(Icons.add),
            ),
            body: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Your Courses"),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("Course Name $index"),
                            subtitle: Text("Lecturer"),
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.calendar_today_outlined),
                                Text(DateTime.now().toString()),
                              ],
                            ),
                            onTap: () {
                              debugPrint("Course Tapped");
                              MyRouter.router.go("/main_page/session_page");
                            },
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 16);
                        },
                        itemCount: 10),
                  )
                ],
              ),
            ),
          );
        },

    );
  }
}
