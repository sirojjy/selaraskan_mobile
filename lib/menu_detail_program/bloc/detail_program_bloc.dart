import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:selaraskan_mobile/menu_detail_program/model/detail_program_model.dart';
import 'package:selaraskan_mobile/menu_program/model/program_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../shared/shared_api.dart';
part 'detail_program_event.dart';
part 'detail_program_state.dart';

class DetailProgramBloc extends Bloc<DetailProgramEvent, DetailProgramState> {
  DetailProgramBloc()
      : super(DetailProgramState(status: DetailProgramStateStatus.initial)) {
    on<OnDetailProgramView>(_detailProgramView);
  }

  Future<void> _detailProgramView(
      OnDetailProgramView event, Emitter<DetailProgramState> emitter) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(state.copyWith(status: DetailProgramStateStatus.loading));
    try {
      var url;
      // Memastikan id_pelabuhan ada di SharedPreferences
      String? idPelabuhan = prefs.getString('id_pelabuhan');
      // if (idPelabuhan == null || event.idProgram == null) {
      //   throw Exception('id_pelabuhan atau id_program tidak ditemukan di SharedPreferences');
      // }

      if(event.data?.idProgram == '54'){
        url = Uri.parse(ApiConstant.programKebersihan);
      }else if(event.data?.idProgram == '99'){
        url = Uri.parse(ApiConstant.programSampah);
      } else {
        url = Uri.parse(ApiConstant.programKebersihan);
      }


      print('Mengirim permintaan ke URL: $url dengan id_pelabuhan: $idPelabuhan dan id_program: ${event.data?.idProgram}');

      var response = await http.post(
        url,
        body: {
          'id_data_program': event.data?.idDataProgram
        },
      );

      // print('Status respons: ${response.statusCode}');
      // print('Body respons: ${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        log('$jsonResponse');

        var listData = <DetailProgramModel>[];

        if (jsonResponse['dataEvidence'] != null) {
          for (var i = 0; i < jsonResponse['dataEvidence'].length; i++) {
            listData.add(DetailProgramModel(
                idPelabuhan: jsonResponse['dataEvidence'][i]['id_pelabuhan'],
                keterangan: jsonResponse['dataEvidence'][i]['keterangan'],
                file: jsonResponse['dataEvidence'][i]['file'],
                tanggal: jsonResponse['dataEvidence'][i]['tanggal'],
                kawasan: jsonResponse['dataEvidence'][i][''],
                fileSesudah: jsonResponse['dataEvidence'][i]['file_sesudah'],
                idProgram: jsonResponse['dataEvidence'][i]['id_program'],
                idDataProgram: jsonResponse['dataEvidence'][i]['id_data_program'],
                area: jsonResponse['dataEvidence'][i]['area']));
          }
        }

        emit(state.copyWith(
            status: DetailProgramStateStatus.success, listProgram: listData));
      } else {
        throw Exception('Gagal memuat data: ${response.statusCode}');
      }
    } catch (error) {
      print('Kesalahan detail program bloc: $error');
      emit(state.copyWith(
          status: DetailProgramStateStatus.error,
          isSuccess: false,
          message: 'Error $error'));
    }
  }
}

// class DetailProgramBloc extends Bloc<DetailProgramEvent, DetailProgramState> {
//   DetailProgramBloc() : super(DetailProgramState(status: status)) {
//     on<OnDetailProgramView>(_validateDetailProgram);
//   }
// }
//
// FutureOr<void> _validateDetailProgram(OnDetailProgramView event, Emitter<DetailProgramState> emit) async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
// }
