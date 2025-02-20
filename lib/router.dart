import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
}

class MyRouter {
  static final router = GoRouter(routes: [
    GoRoute(
        path: "/",
        pageBuilder: (context, state) => MaterialPage(child: StartPages())),
    GoRoute(
        path: Routes.homePage,
        pageBuilder: (context, state) => MaterialPage(child: HomePage()),
        routes: [
          GoRoute(
              path: "/join_session",
              pageBuilder: (context, state) =>
                  MaterialPage(child: JoinSessionPage())),
          GoRoute(
              path: "/session_page",
              pageBuilder: (context, state) =>
                  MaterialPage(child: MeetingPage())),
        ]),
    GoRoute(
      path: "/groups",
      pageBuilder: (context, state) => MaterialPage(child: GroupsPage()),
    ),
    GoRoute(
        path: "/meetings",
        pageBuilder: (context, state) => MaterialPage(child: MeetingsPage()),
        routes: [
          GoRoute(
              path: "/meeting",
              pageBuilder: (context, state) =>
                  MaterialPage(child: MeetingPage()),
              routes: [
                GoRoute(
                  path: "/responses",
                  pageBuilder: (context, state) =>
                      MaterialPage(child: ResponsesPage()),
                )
              ])
        ]),
    GoRoute(
      path: "/universities",
      pageBuilder: (context, state) => MaterialPage(child: HomePage()),
    ),
    GoRoute(
        path: "/settings",
        pageBuilder: (context, state) => MaterialPage(child: HomePage())),
    GoRoute(
        path: "/report",
        pageBuilder: (context, state) => MaterialPage(child: HomePage()))
  ]);
}
