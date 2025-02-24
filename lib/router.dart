import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_faq/pages/groups/add_group_page.dart';
import 'package:student_faq/pages/meetings/meetings_page.dart';
import 'package:student_faq/pages/home_page.dart';
import 'package:student_faq/pages/groups/groups_page.dart';
import 'package:student_faq/pages/responses/responses_page.dart';
import 'package:student_faq/pages/start_pages/login_page.dart';
import 'package:student_faq/pages/meetings/meeting_page.dart';
import 'package:student_faq/pages/start_pages/start_pages.dart';

import 'pages/join_session_page.dart';

class Routes {
  static const String homePage = "/home_page";
  static const String joinSession = "/join_session";
  static const String sessionPage = "/session_page";
  static const String groups = "/groups";
  static const String addGroup = "/add_group";
  static const String meetings = "/meetings";
  static const String meeting = "/meeting";
  static const String responses = "/responses";
  static const String universities = "/universities";
  static const String settings = "/settings";
  static const String report = "/report";
}
//
// GoRouter getRouter() {
//
// }
class MyRouter {
  static late final GoRouter router;
  static setRouter(bool isUserInitialized) {
    router = GoRouter(routes: [
    GoRoute(
        path: "/",
        pageBuilder: (context, state) => MaterialPage(child: isUserInitialized ? HomePage():StartPages())),
    GoRoute(
        path: Routes.homePage,
        pageBuilder: (context, state) => MaterialPage(child: HomePage()),
        routes: [
          GoRoute(
              path: Routes.joinSession,
              pageBuilder: (context, state) =>
                  MaterialPage(child: JoinSessionPage())),
          GoRoute(
              path: Routes.sessionPage,
              pageBuilder: (context, state) =>
                  MaterialPage(child: MeetingPage())),
        ]),
    GoRoute(
      path: Routes.groups,
      pageBuilder: (context, state) => MaterialPage(child: GroupsPage()),
      routes: [
        GoRoute(path: Routes.addGroup, pageBuilder: (context, state) => MaterialPage(child:
        AddGroupPage()) )
      ]
    ),

    GoRoute(
        path: Routes.meetings,
        pageBuilder: (context, state) => MaterialPage(child: MeetingsPage()),
        routes: [
          GoRoute(
              path: Routes.meeting,
              pageBuilder: (context, state) =>
                  MaterialPage(child: MeetingPage()),
              routes: [
                GoRoute(
                  path: Routes.responses,
                  pageBuilder: (context, state) =>
                      MaterialPage(child: ResponsesPage()),
                )
              ])
        ]),
    GoRoute(
      path: Routes.universities,
      pageBuilder: (context, state) => MaterialPage(child: HomePage()),
    ),
    GoRoute(
        path: Routes.settings,
        pageBuilder: (context, state) => MaterialPage(child: HomePage())),
    GoRoute(
        path: Routes.report,
        pageBuilder: (context, state) => MaterialPage(child: HomePage()))
  ]);}
}
