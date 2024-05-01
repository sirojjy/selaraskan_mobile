import 'package:flutter/material.dart';
import 'package:selaraskan_mobile/auth/screen/login.dart';
import 'package:selaraskan_mobile/dashboard_upt/dashboard_upt.dart';
import 'package:selaraskan_mobile/program_modul/daftar_program.dart';
import 'package:selaraskan_mobile/program_modul/form_daftar_program.dart';
import 'package:selaraskan_mobile/shared/routes.dart';
void main ()=> runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Selaraskan V.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      routes: {
        Routes.loginPage : (context) => const Login(),
        Routes.dashboardUPTPage : (context) => const DashboardUPTPage(),
        Routes.daftarProgram : (context) => const DaftarProgram(),
        Routes.formDaftarProgram : (context) => const FormDaftarProgram(),
      },
    );
  }
}
