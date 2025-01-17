
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_faq/pages/courses_page.dart';
import 'package:student_faq/pages/login_page.dart';
import 'package:student_faq/pages/session_page.dart';

import 'pages/join_session_page.dart';

class MyRouter {
  static final router = GoRouter(routes: [
    GoRoute(path: "/", pageBuilder: (context, state) => MaterialPage(child: LoginPage())),
    GoRoute(path: "/main_page", pageBuilder: (context, state) =>
        MaterialPage(child: CoursesPage()),
      routes: [
        GoRoute(path: "/join_session", pageBuilder: (context, state) => MaterialPage(child: JoinSessionPage()))
,        GoRoute(path: "/session_page", pageBuilder: (context, state) => MaterialPage(child: SessionPage()))

      ]
        ),
     ]);
}