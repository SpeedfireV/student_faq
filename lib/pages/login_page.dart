
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_faq/router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(child: Container()),
            ElevatedButton(onPressed: () {
              MyRouter.router.go("/main_page");
            }, child: Text("Authenticate With USOS"))
          ],
        ),
      ),
    );
  }
}
