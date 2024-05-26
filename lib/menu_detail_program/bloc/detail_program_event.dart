part of 'detail_program_bloc.dart';

class DetailProgramEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnDetailProgramView extends DetailProgramEvent {
  final String? idDataProgram;

  OnDetailProgramView({
    this.idDataProgram
});
}