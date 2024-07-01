part of 'validate_data_bloc.dart';

class ValidateDataState extends Equatable {
  final String? idPelabuhan;
  final String? idProgram;
  final String? idDataProgram;
  final XFile? file;
  final XFile? fileSesudah;
  final String? area;
  final String? keterangan;
  final String? areaString;
  final String? data1;
  final String? data2;
  final String? data3;
  final String? data4;
  final String? data5;
  final String? data6;
  final String? data7;
  final String? data8;

  ///Volume Sampah Darat
  final String? sampahDarat;

  bool successUpload;

  ValidateDataState(
      {this.idPelabuhan,
      this.idProgram,
      this.idDataProgram,
      this.file,
      this.fileSesudah,
      this.area,
      this.keterangan,
      this.sampahDarat,
      this.areaString,
      this.data1,
      this.data2,
      this.data3,
      this.data4,
      this.data5,
      this.data6,
      this.data7,
      this.data8,
      this.successUpload = false});

  @override
  List<Object?> get props => [
        idPelabuhan,
        idProgram,
        idDataProgram,
        file,
        fileSesudah,
        area,
        keterangan,
        sampahDarat,
        areaString,
        data1,
        data2,
        data3,
        data4,
        data5,
        data6,
        data7,
        data8,
        successUpload,
      ];

  ValidateDataState copyWith(
      {String? idPelabuhan,
      String? idProgram,
      String? idDataProgram,
      XFile? file,
      XFile? fileSesudah,
      String? area,
      String? keterangan,
      String? sampahDarat,
      String? areaString,
      String? data1,
      String? data2,
      String? data3,
      String? data4,
      String? data5,
      String? data6,
      String? data7,
      String? data8,
      bool? successUpload}) {
    return ValidateDataState(
        idPelabuhan: idPelabuhan ?? this.idPelabuhan,
        idProgram: idProgram ?? this.idProgram,
        idDataProgram: idProgram ?? this.idDataProgram,
        file: file ?? this.file,
        fileSesudah: fileSesudah ?? this.fileSesudah,
        area: area ?? this.area,
        keterangan: keterangan ?? this.keterangan,
        sampahDarat: sampahDarat ?? this.sampahDarat,
        areaString: areaString ?? this.areaString,
        data1: data1 ?? this.data1,
        data2: data2 ?? this.data2,
        data3: data3 ?? this.data3,
        data4: data4 ?? this.data4,
        data5: data5 ?? this.data5,
        data6: data6 ?? this.data6,
        data7: data7 ?? this.data7,
        data8: data8 ?? this.data8,
        successUpload: successUpload ?? this.successUpload);
  }
}
