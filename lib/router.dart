import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_faq/pages/groups/add_group_page.dart';
import 'package:student_faq/pages/groups/join_group_page.dart';
import 'package:student_faq/pages/meetings/add_meeting_page.dart';
import 'package:student_faq/pages/meetings/meetings_page.dart';
import 'package:student_faq/pages/home_page.dart';
import 'package:student_faq/pages/groups/groups_page.dart';
import 'package:student_faq/pages/responses/responses_page.dart';
import 'package:student_faq/pages/start_pages/login_page.dart';
import 'package:student_faq/pages/meetings/meeting_page.dart';
import 'package:student_faq/pages/start_pages/start_pages.dart';

import 'pages/join_session_page.dart';

class RouteDetails {
  final String path;
  final String name;

  const RouteDetails(this.path, this.name);
}

class Routes {
  static const RouteDetails homePage = RouteDetails("/home_page", "homePage");
  static const RouteDetails joinSession =
      RouteDetails("/join_session", "joinSession");
  static const RouteDetails sessionPage =
      RouteDetails("/session_page", "sessionPage");
  static const RouteDetails groups = RouteDetails("/groups", "groups");
  static const RouteDetails joinGroup =
      RouteDetails("/join_group", "joinGroup");
  static const RouteDetails addGroup = RouteDetails("/add_group", "addGroup");
  static const RouteDetails meetings = RouteDetails("/meetings", "meetings");
  static const RouteDetails meeting = RouteDetails("/meeting", "meeting");
  static const RouteDetails addMeeting = RouteDetails("/add_meeting", "addMeeting");
  static const RouteDetails responses = RouteDetails("/responses", "responses");
  static const RouteDetails universities =
      RouteDetails("/universities", "universities");
  static const RouteDetails settings = RouteDetails("/settings", "settings");
  static const RouteDetails report = RouteDetails("/report", "report");
}

class MyRouter {
  static late final GoRouter router;
  static setRouter(bool isUserInitialized) {
    router = GoRouter(routes: [
      GoRoute(
          path: "/",
          pageBuilder: (context, state) => MaterialPage(
              child: isUserInitialized ? const HomePage() : StartPages())),
      GoRoute(
          path: Routes.groups.path,
          name: Routes.groups.name,
          pageBuilder: (context, state) => MaterialPage(child: GroupsPage()),
          routes: [
            GoRoute(
                path: Routes.addGroup.path,
                name: Routes.addGroup.name,
                pageBuilder: (context, state) =>
                    MaterialPage(child: AddGroupPage())),
            GoRoute(
                path: Routes.joinGroup.path,
                name: Routes.joinGroup.name,
                pageBuilder: (context, state) =>
                    MaterialPage(child: JoinGroupPage())),
            GoRoute(
                path: Routes.meetings.path + "/:groupId",
                name: Routes.meetings.name,

                pageBuilder: (context, state) => MaterialPage(child: MeetingsPage(groupId: state.pathParameters["groupId"]!)),
                routes: [
                  GoRoute(path: Routes.addMeeting.path, name: Routes.addMeeting.name, pageBuilder: (context, state) => MaterialPage(child: AddMeetingPage(groupId: state.pathParameters["groupId"]!))),
                  GoRoute(
                      path: Routes.meeting.path + "/:meetingId",
                      name: Routes.meeting.name,
                      pageBuilder: (context, state) =>
                          MaterialPage(child: MeetingPage(groupId: state.pathParameters["groupId"]!, meetingId: state.pathParameters["meetingId"]!)),
                      routes: [
                        GoRoute(
                          path: Routes.responses.path,
                          name: Routes.responses.name,
                          pageBuilder: (context, state) =>
                              MaterialPage(child: ResponsesPage()),
                        )
                      ])
                ]),

          ]),

      GoRoute(
        path: Routes.homePage.path,
        name: Routes.homePage.name,
        pageBuilder: (context, state) => MaterialPage(child: HomePage()),
      ),
      GoRoute(
          path: Routes.settings.path,
          name: Routes.settings.name,
          pageBuilder: (context, state) => MaterialPage(child: HomePage())),
      GoRoute(
          path: Routes.report.path,
          name: Routes.report.name,
          pageBuilder: (context, state) => MaterialPage(child: HomePage()))
    ]);
  }
}
