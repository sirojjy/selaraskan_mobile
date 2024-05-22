import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaraskan_mobile/auth/bloc/auth_bloc.dart';
import 'package:selaraskan_mobile/auth/screen/login.dart';
import 'package:selaraskan_mobile/dashboard_upt/bloc/dashboard_bloc.dart';
import 'package:selaraskan_mobile/dashboard_upt/dashboard_upt.dart';
import 'package:selaraskan_mobile/menu_program/bloc/daftar_program_bloc.dart';
import 'package:selaraskan_mobile/menu_program/daftar_program.dart';
import 'package:selaraskan_mobile/menu_program/form_daftar_program.dart';
import 'package:selaraskan_mobile/shared/routes.dart';
void main () async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (BuildContext context) => AuthBloc()),
          BlocProvider(create: (BuildContext context) => DashboardBloc()),
          BlocProvider(create: (BuildContext context) => DaftarProgramBloc()),
        ], child: const MyApp(),
      )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Selaraskan V.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Login(),
      routes: {
        CustomRoutes.loginPage : (context) => const Login(),
        CustomRoutes.dashboardUPTPage : (context) => const DashboardUPTPage(),
        CustomRoutes.daftarProgram : (context) => const DaftarProgram(),
        CustomRoutes.formDaftarProgram : (context) => const FormDaftarProgram(),
      },
    );
  }
}
