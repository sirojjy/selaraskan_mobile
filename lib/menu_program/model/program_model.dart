
import 'package:flutter/cupertino.dart';

class ProgramModel {
  final String? idProgram;
  final String? idDataProgram;
  final Icon? iconMap;
  final String? namaProgram;
  final String? jenisProgram;
  final String? jadwal;
  final double? score;

  ProgramModel(
      {this.idProgram,
      this.iconMap,
      this.namaProgram,
      this.jenisProgram,
      this.jadwal,
      this.score,
      this.idDataProgram});
}
