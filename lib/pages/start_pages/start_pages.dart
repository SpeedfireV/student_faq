import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:student_faq/bloc/setup/setup_cubit.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/pages/start_pages/login_page.dart';
import 'package:student_faq/pages/start_pages/tutorial_page.dart';
import 'package:student_faq/pages/start_pages/welcome_page.dart';
import 'package:student_faq/services/user_data_service.dart';

class StartPages extends StatelessWidget {
  StartPages({super.key});
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserDataService().isUserIntroduced(),
      builder: (context, state) => BlocProvider(
        create: (context) => SetupCubit(),
        child: BlocListener<SetupCubit, int>(
          listener: (context, state) {
            pageController.animateToPage(state,
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease);
          },
          child: Scaffold(
            body: SafeArea(
              child: Column(children: [
                Expanded(
                  child: PageView(
                    controller: pageController,
                    children: const [
                      WelcomePage(),
                      TutorialPage(),
                      LoginPage()
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 4,
                    effect: SlideEffect(
                        radius: 5,
                        dotHeight: 30,
                        dotWidth: 30,
                        dotColor: ColorPalette.lightBlue,
                        activeDotColor: ColorPalette.darkBlue),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
