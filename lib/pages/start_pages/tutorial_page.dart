import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/setup/setup_cubit.dart';
import 'package:student_faq/consts/color_palette.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
      child: Column(
        children: [
          Icon(
            Icons.question_mark,
            color: ColorPalette.darkBlue,
            size: 60,
          ),
          Text(
            "Jak To działa?",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Expanded(child: Container()),
          RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.bodyLarge,
                children: [
                  TextSpan(
                      text:
                          "Aplikacja StudentFAQ ma za zadanie ułatwić komunikację między studentami, a wykładowcami.\n\n"),
                  TextSpan(
                      text: "STUDENT:\n",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          "Dzięki aplikacji jako będziesz mógł zupełnie anonimowo zadawać pytania wykładowcy w trakcie trwania zajęć. Będziesz miał/a, także wgląd do wszystkich pytań i odpowiedzi, które padły na poprzednich zajęciach, by utrwalić swoją wiedzę.\n"),
                  TextSpan(
                      text: "WYKŁADOWCA:\n",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(
                      text:
                          "Dzięki aplikacji twoi studenci będą mogli z łatwością zadawać Ci pytania na żywo bez konieczności wcinania Ci się w zdanie. Będziesz mógł/mogła, także sprawdzić, które zagadnienia są dla twoich studentów szczególnie problematyczne i to na nich położyć większy nacisk.\n"),
                ]),
            textAlign: TextAlign.center,
          ),
          Expanded(child: Container()),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<SetupCubit>(context).nextPage();
              },
              child: Text(
                "DALEJ",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: ColorPalette.snowWhiteColor,
                    fontWeight: FontWeight.bold),
              ))
        ],
      ),
    );
  }
}
