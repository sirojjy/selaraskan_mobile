part of 'daftar_program_bloc.dart';

sealed class DaftarProgramEvent extends Equatable {
  const DaftarProgramEvent();
  List<Object> get props => [];
}

class OnViewProgram extends DaftarProgramEvent {}