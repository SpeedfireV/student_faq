import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_faq/pages/courses/courses_page.dart';
import 'package:student_faq/pages/home_page.dart';
import 'package:student_faq/pages/programmes/programmes_page.dart';
import 'package:student_faq/pages/responses/responses_page.dart';
import 'package:student_faq/pages/start_pages/login_page.dart';
import 'package:student_faq/pages/session_page.dart';
import 'package:student_faq/pages/start_pages/start_pages.dart';

import 'pages/join_session_page.dart';

class MyRouter {
  static final router = GoRouter(routes: [
    GoRoute(
        path: "/",
        pageBuilder: (context, state) => MaterialPage(child: StartPages())),
    GoRoute(
        path: "/home_page",
        pageBuilder: (context, state) => MaterialPage(child: HomePage()),
        routes: [
          GoRoute(
              path: "/join_session",
              pageBuilder: (context, state) =>
                  MaterialPage(child: JoinSessionPage())),
          GoRoute(
              path: "/session_page",
              pageBuilder: (context, state) =>
                  MaterialPage(child: SessionPage())),
        ]),
    GoRoute(path: "/groups"),
    GoRoute(path: "/meetings"),
    GoRoute(path: "/universities"),
    GoRoute(path: "/settings"),
    GoRoute(path: "/report")
  ]);
}
