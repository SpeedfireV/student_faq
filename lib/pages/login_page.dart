import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_faq/bloc/usos_authentication/entered_pin_cubit.dart';
import 'package:student_faq/bloc/usos_authentication/usos_authentication_bloc.dart';
import 'package:student_faq/router.dart';

import '../services/usos_service.dart';

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
    // TODO: implement dispose
    super.dispose();
    PINInputController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [BlocProvider(create: (context) => EnteredPinCubit())],
  child: BlocBuilder<EnteredPinCubit, String>(
  builder: (context, state) {
    return BlocListener<UsosAuthenticationBloc, UsosAuthenticationState>(
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
                Expanded(child: Container()),
                ElevatedButton(onPressed: () async {
                  BlocProvider.of<UsosAuthenticationBloc>(context).add(UsosAuthenticationObtainPIN());
                }, child: Text("Get Authentication PIN")),
                TextField(
                  controller: PINInputController,
                  decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "PIN",


                ),
                  onChanged: (String newPin) {
                    BlocProvider.of<EnteredPinCubit>(context).changePin(newPin);
                  },
                  keyboardType: TextInputType.number,

                ),

                       ElevatedButton(onPressed: state != "" ?  () async {
                        BlocProvider.of<UsosAuthenticationBloc>(context).add(UsosAuthenticationAuthenticate(PINInputController.text));
                      } : null , child: Text("Enter PIN"))

              ],
            ),
          ),

      ),
    );
  },
),
);
  }
}
