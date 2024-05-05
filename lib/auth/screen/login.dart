import 'package:flutter/material.dart';
import 'package:selaraskan_mobile/dashboard_upt/dashboard_upt.dart';
import 'background.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: BackgroundLogin(
          loginForm: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Image.asset("assets/logo/logo-kkp-2021.png"),
                ),
              ),
              SizedBox(
                height: size.height * 0.05,
              ),
              const SizedBox(
                  height: 40,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffffffff),
                        fontSize: 36,
                      ),
                    ),
                  )),
              SizedBox(
                height: size.height * 0.05,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40.0)),
                    fillColor: const Color(0xffffffff),
                    filled: true,
                  ),
                  //   controller: usernameController,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 40),
                // decoration: BoxDecoration(
                //   border: Border.all(color: Color(0xff007BFF)),
                // ),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                      borderSide: const BorderSide(
                        color: Color(0xffffffff),
                        width: 2.0,
                      ),
                    ),
                    fillColor: const Color(0xffffffff),
                    filled: true,
                    hintText: 'Password',
                  ),
                  //   controller: usernameController,
                  obscureText: true,
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                margin:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: const Text(
                  ' Lupa password? ',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xffffffff),
                    backgroundColor: Color(0xff737373)
                  ),
                ),
              ),
              // SizedBox(height: size.height * 0.03,),
              Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: SizedBox(
                    height: 60,
                    width: double.infinity, // Expand horizontally
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff007BFF)),
                      onPressed: () => {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardUPTPage()))
                      },
                      child: const SizedBox(
                        // height: size.height * 0.06,
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
