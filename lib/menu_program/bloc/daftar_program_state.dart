part of 'daftar_program_bloc.dart';

enum DaftarProgramStateStatus { initial, success, error, loading }

extension DaftarProgramInitial on DaftarProgramStateStatus {
  bool get isInitial => this == DaftarProgramStateStatus.initial;
  bool get success => this == DaftarProgramStateStatus.success;
  bool get error => this == DaftarProgramStateStatus.error;
  bool get loading => this == DaftarProgramStateStatus.loading;
}

class DaftarProgramState extends Equatable {
  final DaftarProgramStateStatus status;
  final List<ProgramModel> dataProgram;
  final String? message;
  final bool? isSucess;

  const DaftarProgramState({
        this.status = DaftarProgramStateStatus.initial,
        required this.dataProgram,
        this.message,
        this.isSucess
      });

  @override
  // TODO: implement props
  List<Object?> get props => [
    status,
    message,
    dataProgram,
    isSucess
  ];
  DaftarProgramState copyWith({
    DaftarProgramStateStatus? status,
    String? message,
    List<ProgramModel>? dataProgram,
    bool? isSucess
}){
    return DaftarProgramState(
      status: status ?? this.status,
      message: message ?? this.message,
      dataProgram: dataProgram ?? this.dataProgram,
      isSucess: isSucess ?? this.isSucess,
    );
}
}
