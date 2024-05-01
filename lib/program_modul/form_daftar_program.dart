import 'package:flutter/material.dart';

class FormDaftarProgram extends StatefulWidget {
  const FormDaftarProgram({super.key});

  @override
  State<FormDaftarProgram> createState() => _FormDaftarProgramState();
}

class _FormDaftarProgramState extends State<FormDaftarProgram> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(title: Text('Tambah Data'),),
      body: Container(
        child: Text('Tambah Data Sekarang'),
      ),
    ));
  }
}
