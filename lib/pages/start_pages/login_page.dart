import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/usos_authentication/entered_pin_cubit.dart';
import 'package:student_faq/bloc/usos_authentication/usos_authentication_bloc.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/consts/styles/button_styles.dart';
import 'package:student_faq/consts/styles/text_styles.dart';
import 'package:student_faq/router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController PINInputController;

  @override
  void initState() {
    super.initState();
    PINInputController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    PINInputController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
      child: MultiBlocProvider(
        providers: [BlocProvider(create: (context) => EnteredPinCubit())],
        child: BlocBuilder<EnteredPinCubit, String>(
          builder: (context, state) {
            return BlocListener<UsosAuthenticationBloc,
                UsosAuthenticationState>(
              listener: (context, state) {
                if (state is UsosAuthenticationUserAuthenticated) {
                  MyRouter.router.go("/main_page");
                }
              },
              child: Scaffold(
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Icon(
                        Icons.login,
                        size: 60,
                        color: ColorPalette.darkBlue,
                      ),
                      SizedBox(height: 16),
                      Text(
                        "LOGOWANIE",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Expanded(child: Container()),
                      Text(
                        """
Jeżeli twoja uczelnia korzysta z systemu USOS możesz w tym momencie zalogować się, by zsynchronizować dane o wszystkich zajęciach i kierunkach, na które uczęszczasz.

Możesz zalogować się, również później.
""",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Expanded(child: Container()),
                      ElevatedButton(
                          onPressed: () async {
                            BlocProvider.of<UsosAuthenticationBloc>(context)
                                .add(UsosAuthenticationObtainPIN());
                          },
                          child: Text(
                            "POBIERZ KOD",
                            style: TextStyles.buttonText,
                          )),
                      SizedBox(height: 16),
                      TextField(
                        controller: PINInputController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "PIN",
                        ),
                        onChanged: (String newPin) async {
                          if (await BlocProvider.of<EnteredPinCubit>(context)
                                  .changePin(newPin) ==
                              true) {
                            BlocProvider.of<UsosAuthenticationBloc>(context)
                                .add(UsosAuthenticationAuthenticate(newPin));
                            print(newPin);
                          }
                        },
                        keyboardType: TextInputType.number,
                      ),
                      SizedBox(height: 16),
                      const Text("LUB"),
                      SizedBox(height: 16),
                      ElevatedButton(
                          onPressed: () {
                            MyRouter.router.go("/home_page");
                          },
                          style: ButtonStyles.primaryInversedElevatedButton,
                          child: Text(
                            "POMIŃ",
                            style: TextStyles.buttonText,
                          ))
                      // ElevatedButton(
                      //     onPressed: state != ""
                      //         ? () async {
                      //             BlocProvider.of<UsosAuthenticationBloc>(context)
                      //                 .add(UsosAuthenticationAuthenticate(
                      //                     PINInputController.text));
                      //           }
                      //         : null,
                      //     child: Text("Enter PIN"))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
