import 'package:flutter/material.dart';

class BackgroundLogin extends StatelessWidget {
  final Widget loginForm;
  const BackgroundLogin({
    Key? hey,
    required this.loginForm,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("assets/bg-selaraskan.jpg")
        )
      ),
      child: loginForm,
    );
  }
}
