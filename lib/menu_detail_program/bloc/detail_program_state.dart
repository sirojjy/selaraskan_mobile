part of 'detail_program_bloc.dart';

enum DetailProgramStateStatus { initial, success, error, loading }

extension DetailProgramInitial on DetailProgramStateStatus {
  bool get isInitial => this == DetailProgramStateStatus.initial;
  bool get success => this == DetailProgramStateStatus.success;
  bool get error => this == DetailProgramStateStatus.error;
  bool get loading => this == DetailProgramStateStatus.loading;
}

class DetailProgramState extends Equatable {
  final DetailProgramStateStatus status;
  final String? idPelabuhan;
  final String? idProgram;
  final String? idGaleri;
  final String? keterangan;
  final String? tanggal;
  final String? area;
  final String? message;
  final bool? isSuccess;

  DetailProgramState({
    this.idPelabuhan,
    this.idProgram,
    this.idGaleri,
    this.keterangan,
    this.tanggal,
    this.area,
    required this.status,
    this.message,
    this.isSuccess,
  });

  @override
  List<Object?> get props => [
    idPelabuhan,
    idProgram,
    idGaleri,
    keterangan,
    tanggal,
    area,
    status,
    message,
    isSuccess,
  ];

  DetailProgramState copyWith({
    DetailProgramStateStatus? status,
    String? idPelabuhan,
    String? idProgram,
    String? idGaleri,
    String? keterangan,
    String? tanggal,
    String? area,
    String? message,
    bool? isSuccess,
  }) {
    return DetailProgramState(
      idPelabuhan: idPelabuhan ?? this.idPelabuhan,
      idProgram: idProgram ?? this.idProgram,
      idGaleri: idGaleri ?? this.idGaleri,
      keterangan: keterangan ?? this.keterangan,
      tanggal: tanggal ?? this.tanggal,
      area: area ?? this.area,
      status: status ?? this.status,
      message: message ?? this.message,
      isSuccess: isSuccess ?? this.isSuccess,
    );
  }
}

/// Shared Preferences props id_data_program
// {
// "status": "success",
// "dataEvidence": [
// {
// "id_galeri": "26368",
// "id_pelabuhan": "67",
// "keterangan": "qaaa",
// "file": "logo_shakti_png_13-05-2024_11-12-14.png", FOTO sebelum
// "tanggal": "2024-05-13",
// "create_date": "2024-05-13 11:12:14",
// "kawasan": null,
// "id_kebersihan": null,
// "file_sesudah": "1_1_Photo_jpg_13-05-2024_11-12-14.jpg", FOTO sesudah
// "id_program": "2920",
// "area": "1"
// },
