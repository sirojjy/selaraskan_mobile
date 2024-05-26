part of 'validate_data_bloc.dart';

class ValidateDataState extends Equatable {
  final String? idPelabuhan;
  final String? idProgram;
  final XFile? file;
  final XFile? fileSesudah;

  ValidateDataState({
    this.idPelabuhan,
    this.idProgram,
    this.file,
    this.fileSesudah
  });

  @override
  List<Object?> get props => [
    idPelabuhan,
    idProgram,
    file,
    fileSesudah
  ];

  ValidateDataState copyWith({
    String? idPelabuhan,
    String? idProgram,
    XFile? file,
    XFile? fileSesudah
  }) {
    return ValidateDataState(
      idPelabuhan: idPelabuhan ?? this.idPelabuhan,
      idProgram: idProgram ?? this.idProgram,
      file: file ?? this.file,
      fileSesudah: fileSesudah ?? this.fileSesudah
    );
  }
}
