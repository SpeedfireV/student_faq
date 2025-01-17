
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:student_faq/pages/session_page.dart';

import 'pages/main_page.dart';

class MyRouter {
  static final router = GoRouter(routes: [

    GoRoute(path: "/", pageBuilder: (context, state) => 
        MaterialPage(child: MainPage())
        ),
    GoRoute(path: "/main_page", pageBuilder: (context, state) =>
  MaterialPage(child: MainPage())),
    GoRoute(path: "/session_page", pageBuilder: (context, state) => MaterialPage(child: SessionPage()))
  ]);
}