part of 'validate_data_bloc.dart';

class ValidateDataState extends Equatable {
  final String? idPelabuhan;
  final String? idProgram;
  final XFile? file;
  final XFile? fileSesudah;
  final String? area;
  final String? keterangan;
  bool successUpload;

  ValidateDataState({
    this.idPelabuhan,
    this.idProgram,
    this.file,
    this.fileSesudah,
    this.area,
    this.keterangan,
    this.successUpload = false
  });

  @override
  List<Object?> get props => [
    idPelabuhan,
    idProgram,
    file,
    fileSesudah,
    area,
    keterangan,
    successUpload
  ];

  ValidateDataState copyWith({
    String? idPelabuhan,
    String? idProgram,
    XFile? file,
    XFile? fileSesudah,
    String? area,
    String? keterangan,
    bool? successUpload
  }) {
    return ValidateDataState(
      idPelabuhan: idPelabuhan ?? this.idPelabuhan,
      idProgram: idProgram ?? this.idProgram,
      file: file ?? this.file,
      fileSesudah: fileSesudah ?? this.fileSesudah,
      area: area ?? this.area,
      keterangan: keterangan ?? this.keterangan,
      successUpload: successUpload ?? this.successUpload
    );
  }
}
