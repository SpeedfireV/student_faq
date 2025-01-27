import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:student_faq/router.dart';
import 'package:student_faq/services/usos_service.dart';

import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await UsosService.authenticateUser();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyRouter.router, //
    );
  }
}
