import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/groups/groups_bloc.dart';
import 'package:student_faq/bloc/login/login_bloc.dart';
import 'package:student_faq/bloc/login/login_event.dart';
import 'package:student_faq/bloc/login/login_state.dart';
import 'package:student_faq/consts/color_palette.dart';
import 'package:student_faq/consts/styles/button_styles.dart';
import 'package:student_faq/consts/styles/text_styles.dart';
import 'package:student_faq/router.dart';
import 'package:student_faq/services/auth_service.dart';
import 'package:student_faq/services/user_data_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController loginController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    loginController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    loginController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc())
      ],
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) =>
                BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
              if (state is LoginSuccessful) {
                MyRouter.router.goNamed(Routes.homePage.name);
              } else if (state is LoginUnsuccessful) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                  "${state.error.message}",
                  textAlign: TextAlign.center,
                )));
              }
            }, builder: (context, state) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: constraints.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
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
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge,
                              ),
                              Spacer(),
                              SizedBox(height: 16),
                              TextField(
                                controller: loginController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Login",
                                ),
                                onChanged: (String newPin) async {

                                },
                                keyboardType: TextInputType.emailAddress,
                              ),
                              SizedBox(height: 16),
                              TextField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Hasło",
                                ),
                                onChanged: (String newPin) async {
                                },
                                keyboardType: TextInputType.text,
                              ),
                              SizedBox(height: 16),
                              const Text("LUB"),
                              SizedBox(height: 16),
                              ElevatedButton(
                                  onPressed: () async {
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(LoginSubmitForm(
                                            loginController.text,
                                            passwordController.text));
                                  },
                                  style: ButtonStyles
                                      .primaryInversedElevatedButton,
                                  child: Text(
                                    "ZALOGUJ SIĘ",
                                    style: TextStyles.buttonText,
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  state is LoginParsing
                      ? Container(
                          color: ColorPalette.lightBlue.withOpacity(0.4),
                          width: double.infinity,
                          height: double.infinity,
                          child: Center(
                              child: CircularProgressIndicator(
                            color: ColorPalette.brown,
                          )),
                        )
                      : Container()
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
