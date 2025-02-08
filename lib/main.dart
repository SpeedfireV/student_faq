import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:student_faq/bloc/usos_authentication/usos_authentication_bloc.dart';
import 'package:student_faq/router.dart';
import 'package:student_faq/services/usos_service.dart';

import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( BlocProvider(child: const MainApp(),create: (context) => UsosAuthenticationBloc(),));
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
