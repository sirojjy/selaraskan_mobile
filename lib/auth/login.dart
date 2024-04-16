import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 330,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Image.asset("assets/logo/logo-kkp-2021.png"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
