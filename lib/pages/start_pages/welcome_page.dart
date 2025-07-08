import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/setup/setup_cubit.dart';
import 'package:student_faq/consts/color_palette.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16),
      child: Column(
        children: [
          RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text: "WITAJ W\n",
                    style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: ColorPalette.darkBlue,
                        fontStyle: FontStyle.normal)),
                TextSpan(
                    children: const [
                      TextSpan(text: "S"),
                      TextSpan(
                        text: "TUDENT",
                        style: TextStyle(fontSize: 48),
                      ),
                      TextSpan(text: "FAQ")
                    ],
                    style: TextStyle(
                        fontSize: 60,
                        fontWeight: FontWeight.w900,
                        color: ColorPalette.darkBlue,
                        fontStyle: FontStyle.italic)),
              ])),
          Expanded(child: Container()),
          RichText(
            text: const TextSpan(children: [
              TextSpan(
                  text:
                      "Większość nauczycieli traci czas na to, by dowiedzieć się, czego uczniowie nie wiedzą.",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
              TextSpan(text: "\n"),
              TextSpan(
                  text: "~ Albert Einstein",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 32))
            ], style: TextStyle(color: Colors.black)),
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
