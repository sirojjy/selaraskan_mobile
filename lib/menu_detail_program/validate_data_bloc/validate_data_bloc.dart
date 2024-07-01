import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:selaraskan_mobile/shared/shared_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../menu_program/model/program_model.dart';

part 'validate_data_event.dart';
part 'validate_data_state.dart';

class ValidateDataBloc extends Bloc<ValidateDataEvent, ValidateDataState> {
  ValidateDataBloc() : super(ValidateDataState()) {
    on<ValidateDataEvent>((event, emit) async {
      if (event is ChangeImageFile) {
        emit(state.copyWith(file: event.filePickData));
      } else if (event is ChangeImageFileSesudah) {
        emit(state.copyWith(fileSesudah: event.filePickData));
      } else if (event is SetIdProgram) {
        emit(state.copyWith(idProgram: event.idDataProgram));
      } else if (event is ChangeArea) {
        emit(state.copyWith(area: event.value));
      } else if (event is ChangeKeterangan) {
        emit(state.copyWith(keterangan: event.value));
      } else if (event is ChangeSampahDarat) {
        emit(state.copyWith(sampahDarat: event.value));
      } else if (event is ChangeAreaString) {
        emit(state.copyWith(areaString: event.value));
      } else if (event is ChangeData1) {
        emit(state.copyWith(data1: event.value));
      } else if (event is ChangeData2) {
        emit(state.copyWith(data2: event.value));
      } else if (event is ChangeData3) {
        emit(state.copyWith(data3: event.value));
      } else if (event is ChangeData4) {
        emit(state.copyWith(data4: event.value));
      } else if (event is ChangeData5) {
        emit(state.copyWith(data5: event.value));
      } else if (event is ChangeData6) {
        emit(state.copyWith(data6: event.value));
      } else if (event is ChangeData7) {
        emit(state.copyWith(data7: event.value));
      } else if (event is ChangeData8) {
        emit(state.copyWith(data8: event.value));
      } else if (event is SubmitData) {

        /// kerjain submit datanya di sini
        /// kalau yg mau di lempar harus file ubah dulu xfile jadi file
        /// cartanya gini File(state.file.path)

        SharedPreferences prefs = await SharedPreferences.getInstance();
        final idPelabuhan = prefs.getString('id_pelabuhan');
        final idProgramMaster = prefs.getString('id_program');
        print('ID PROGRAM MASTER $idProgramMaster');

        final file = File('${state.file?.path}');
        final fileSesudah = File('${state.fileSesudah?.path}');

        /// tinggal hit api upload, caranya sama kayak yg upload file dari gallery

        var url;
        // = Uri.parse(ApiConstant.addProgramKebersihan);

        if(idProgramMaster == '4'){
          url = Uri.parse(ApiConstant.addHematEnergi);
        }else if(idProgramMaster == '5'){
          url = Uri.parse(ApiConstant.addPatroliEnergi);
        }else if(idProgramMaster == '7'){
          url = Uri.parse(ApiConstant.addHimbauanK3);
        }else if(idProgramMaster == '9'){
          url = Uri.parse(ApiConstant.addPatroliK3);
        }else if(idProgramMaster == '15'){
          url = Uri.parse(ApiConstant.addRTH);
        }else if(idProgramMaster == '43'){
          url = Uri.parse(ApiConstant.addLampu);
        }else if(idProgramMaster == '47'){
          url = Uri.parse(ApiConstant.addKualitasUdara);
        }else if(idProgramMaster == '48'){
          url = Uri.parse(ApiConstant.addKualitasAir);
        }else if(idProgramMaster == '49'){
          url = Uri.parse(ApiConstant.addAirLimbah);
        }else if(idProgramMaster == '51'){
          url = Uri.parse(ApiConstant.addSampahDarat);
        }else if(idProgramMaster == '52'){
          url = Uri.parse(ApiConstant.addSampahLaut);
        }else if(idProgramMaster == '53'){
          url = Uri.parse(ApiConstant.addPemilahanSampah);
        }else if(idProgramMaster == '54'){
          url = Uri.parse(ApiConstant.addProgramKebersihan);
        }else if(idProgramMaster == '58'){
          url = Uri.parse(ApiConstant.addLimbahB3);
        }else if(idProgramMaster == '60'){
          url = Uri.parse(ApiConstant.addTenan);
        }else if(idProgramMaster == '64'){
          url = Uri.parse(ApiConstant.addIso);
        }else if(idProgramMaster == '99'){
          url = Uri.parse(ApiConstant.addPengolahanSampah);
        }else if(idProgramMaster == '100'){
          url = Uri.parse(ApiConstant.addDrone);
        }else {
          url = Uri.parse(ApiConstant.programUploadDrone); // Default URL jika tidak ada yang cocok
        }

        print('ID Program 1 : ${state.idProgram}');
        // print('ID Program 1 : ${d}');
        print('ID Data Program : ${state.idDataProgram}');

        var request = http.MultipartRequest("POST", url);
        // request.fields['id_pelabuhan'] = '$idPelabuhan';
        // request.fields['id_data_program'] = '${state.idDataProgram}';
        // request.fields['area'] = '${state.area}';
        // request.fields['keterangan'] = '${state.keterangan}';
        // request.files.add(await http.MultipartFile.fromPath('file', file.path));
        // request.files.add(await http.MultipartFile.fromPath('file_sesudah', fileSesudah.path));
        // request.fields['tanggal'] = '${DateTime.now()}';
        /// GAWER KONDISI MENEH NENG KNE
        print('id program 2 ${state.idProgram}');

        if(idProgramMaster == '4') {
          ///Himbauan Hemat Energi
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['area'] = '${state.area}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.files.add(await http.MultipartFile.fromPath('file', fileSesudah.path));

        }else if(idProgramMaster == '5'){
          ///Himbauan Patroli Energi
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['area'] = '${state.area}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.files.add(await http.MultipartFile.fromPath('file', fileSesudah.path));

        }else if(idProgramMaster == '7'){
          ///Himbauan Keselamatan
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['area'] = '${state.area}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.files.add(await http.MultipartFile.fromPath('file', fileSesudah.path));

        }else if(idProgramMaster == '9'){
          ///Patroli Keselamatan K3
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['area'] = '${state.area}';
          request.fields['peralatan_dermaga'] = '${state.data1}';
          request.fields['peralatan_kapal'] = '${state.data2}';
          request.fields['kesesuaian_zonasi'] = '${state.data3}';
          request.fields['kesesuaian_perbaikan'] = '${state.data4}';
          request.fields['jaga_kapal'] = '${state.data5}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.files.add(await http.MultipartFile.fromPath('file', fileSesudah.path));

        }else if(idProgramMaster == '15'){
          ///Upaya Pemeliharaan RTH
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['luas_rta'] = '${state.data1}';
          request.fields['luas_pelabuhan'] = '${state.data2}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.files.add(await http.MultipartFile.fromPath('file', fileSesudah.path));

        }else if(idProgramMaster == '43'){
          ///Penggunaan Lampu Hemat Energi
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['total_lampu'] = '${state.data1}';
          request.fields['lampu_led'] = '${state.data2}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.files.add(await http.MultipartFile.fromPath('file', fileSesudah.path));

        }else if(idProgramMaster == '47'){
          ///Pengukuran Kualitas Udara
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['area'] = '${state.area}';
          request.fields['metode'] = '${state.data1}';
          request.fields['kebauan'] = '${state.data2}';
          request.fields['co'] = '${state.data3}';
          request.fields['pm_25'] = '${state.data4}';
          request.fields['pm_10'] = '${state.data5}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.files.add(await http.MultipartFile.fromPath('file', fileSesudah.path));

        }else if(idProgramMaster == '48'){
          ///Pengukuran Kualitas Air
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['metode'] = '${state.data1}';
          request.fields['kebauan'] = '${state.data2}';
          request.fields['ph'] = '${state.data3}';
          request.fields['kecerahan'] = '${state.data4}';
          request.fields['lapisan_minyak'] = '${state.data5}';
          request.fields['sampah'] = '${state.data6}';
          request.fields['coliform'] = '${state.data7}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.files.add(await http.MultipartFile.fromPath('file', fileSesudah.path));

        }else if(idProgramMaster == '49'){
          ///Pengukuran Air Limbah Pelabuhan
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['metode'] = '${state.data1}';
          request.fields['kebauan'] = '${state.data2}';
          request.fields['ph'] = '${state.data3}';
          request.fields['lapisan_minyak'] = '${state.data4}';
          request.fields['bod'] = '${state.data5}';
          request.fields['cod'] = '${state.data6}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.files.add(await http.MultipartFile.fromPath('file', fileSesudah.path));

        }else if(idProgramMaster == '51'){ ///Volume Sampah Darat
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['total_sampah'] = '${state.data1}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.files.add(await http.MultipartFile.fromPath('evidence', fileSesudah.path));

        }else if(idProgramMaster == '52'){ ///Volume Sampah Laut
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.fields['sampah_kapal'] = '${state.data1}';
          request.fields['sampah_kolam'] = '${state.data2}';
          request.fields['sampah_laut'] = '${state.data3}';
          request.files.add(await http.MultipartFile.fromPath('evidence', fileSesudah.path));

        }else if(idProgramMaster == '53'){ ///Pemilahan Sampah
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.fields['darat_organik_daun'] = '${state.data1}';
          request.fields['darat_organik_lainnya'] = '${state.data2}';
          request.fields['darat_anorganik_plastik'] = '${state.data3}';
          request.fields['darat_anorganik_lainnya'] = '${state.data4}';
          request.files.add(await http.MultipartFile.fromPath('file', fileSesudah.path));

        }else if(idProgramMaster == '54') {
          ///Volume Sampah Laut
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_data_program'] = '${state.idDataProgram}';
          request.fields['area'] = '${state.area}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.files.add(await http.MultipartFile.fromPath('file', file.path));
          request.files.add(await http.MultipartFile.fromPath('file_sesudah', fileSesudah.path));

        }else if(idProgramMaster == '58'){ ///Penampungan Limbah B3
          request.fields['id_pelabuhan'] = '$idPelabuhan';
          request.fields['id_program'] = '${state.idDataProgram}';
          request.fields['keterangan'] = '${state.keterangan}';
          request.fields['tot_oli'] = '${state.data1}';
          request.fields['olah_oli'] = '${state.data2}';
          request.fields['tot_baterai'] = '${state.data3}';
          request.fields['olah_baterai'] = '${state.data4}';
          request.fields['olah_lampu'] = '${state.data5}';
          request.fields['tot_lampu'] = '${state.data6}';
          request.fields['tot_lain'] = '${state.data7}';
          request.fields['olah_lain'] = '${state.data8}';
          request.files.add(await http.MultipartFile.fromPath('file', fileSesudah.path));
        }
        await request.send().then((response) {
          print('Ini kan url: $url id_progam: $idProgramMaster id_pel: ${idPelabuhan} id_data: ${state.idDataProgram} area: ${state.area} ket:${state.keterangan} file1: ${state.file} file2: ${state.fileSesudah} date: ${DateTime.now()} data1: ${state.data1} data2: ${state.data2} data3: ${state.data3} data4: ${state.data4} data5: ${state.data5} data6: ${state.data6} data7: ${state.data7}');
          if (response.statusCode == 200) print("Sukses! ${response.stream}, id program 3 $idProgramMaster");
        });

        emit(state.copyWith(successUpload: true));
      }
    });
  }
}
