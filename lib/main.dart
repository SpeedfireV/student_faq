import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_faq/bloc/drawer_navigation/navigation_cubit.dart';
import 'package:student_faq/bloc/groups/groups_bloc.dart';
import 'package:student_faq/bloc/keyboard/keyboard_cubit.dart';
import 'package:student_faq/bloc/usos_authentication/usos_authentication_bloc.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/router.dart';
import 'package:student_faq/services/user_data_service.dart';

import 'firebase_options.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  WidgetsFlutterBinding.ensureInitialized();
  final isUserIntroduced = await UserDataService().isUserIntroduced();
  MyRouter.setRouter(isUserIntroduced ?? false);
  runApp(MultiBlocProvider(
    child: const MainApp(),
    providers: [
      BlocProvider(create: (context) => UsosAuthenticationBloc()),
      BlocProvider(create: (context) => NavigationCubit()),
      BlocProvider(create: (context) => GroupsBloc()),
      BlocProvider(create: (context) => KeyboardCubit())
    ],
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
                  EdgeInsets.symmetric(vertical: 20, horizontal: 16),
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
              minimumSize: Size(double.infinity, 80),
              textStyle: TextStyle(color: ColorPalette.snowWhiteColor),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              backgroundColor: ColorPalette.buttonBackgroundColor,
            ),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: ColorPalette.buttonBackgroundColor,
            smallSizeConstraints: BoxConstraints(minWidth: 60, minHeight: 60),
            largeSizeConstraints: BoxConstraints(minWidth: 80, minHeight: 80),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          )),

      routerConfig: MyRouter.router, //
    );
  }
}
