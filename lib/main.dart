import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_faq/bloc/drawer_navigation/navigation_cubit.dart';
import 'package:student_faq/bloc/groups/groups_bloc.dart';
import 'package:student_faq/bloc/keyboard/keyboard_cubit.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/router.dart';
import 'package:student_faq/services/user_data_service.dart';

import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if (false) {
    // Connect Firestore to Emulator
    FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);

    FirebaseAuth.instance.useAuthEmulator('localhost', 9099);

    // Connect Firebase Functions to Emulator
    FirebaseFunctions.instance.useFunctionsEmulator('localhost', 5001);
  }

  WidgetsFlutterBinding.ensureInitialized();
  MyRouter.setRouter(FirebaseAuth.instance.currentUser !=
      null); // TODO: Set FirebaseAuth.instance.currentUser != null
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => NavigationCubit()),
      BlocProvider(create: (context) => GroupsBloc()),
      BlocProvider(create: (context) => KeyboardCubit())
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: ColorPalette.darkBlue, width: 2)),
              fillColor: ColorPalette.snowWhiteColor,
              filled: true),
          primaryColor: ColorPalette.darkBlue,
          scaffoldBackgroundColor: ColorPalette.backgroundColor,
          textTheme: GoogleFonts.firaSansTextTheme(Typography.blackHelsinki
              .copyWith(
                  headlineLarge: TextStyle(
                      color: ColorPalette.darkBlue,
                      fontSize: 36,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w900),
                  headlineMedium:
                      TextStyle(color: ColorPalette.darkBlue, fontSize: 27))),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 80),
              textStyle: TextStyle(color: ColorPalette.snowWhiteColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              foregroundColor: ColorPalette.snowWhiteColor,
              backgroundColor: ColorPalette.buttonBackgroundColor,
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: ColorPalette.buttonBackgroundColor,
            smallSizeConstraints:
                const BoxConstraints(minWidth: 60, minHeight: 60),
            largeSizeConstraints:
                const BoxConstraints(minWidth: 80, minHeight: 80),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          )),

      routerConfig: MyRouter.router, //
    );
  }
}
