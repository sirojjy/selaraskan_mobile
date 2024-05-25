import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
      // Memastikan id_pelabuhan dan id_program ada di SharedPreferences
      String? idPelabuhan = prefs.getString('id_pelabuhan');
      String? idProgram = prefs.getString('id_program');
      if (idPelabuhan == null || idProgram == null) {
        throw Exception('id_pelabuhan atau id_program tidak ditemukan di SharedPreferences');
      }

      var url = Uri.parse(ApiConstant.detailProgram);
      // print('Mengirim permintaan ke URL: $url dengan id_pelabuhan: $idPelabuhan dan id_program: $idProgram');

      var response = await http.post(
        url,
        body: {'id_pelabuhan': idPelabuhan, 'id_data_program': idProgram},
      );

      // print('Status respons: ${response.statusCode}');
      // print('Body respons: ${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var detail = jsonResponse['dataEvidence'][0];

        emit(state.copyWith(
          status: DetailProgramStateStatus.success,
          idPelabuhan: detail['id_pelabuhan'],
          idProgram: detail['id_program'],
          idGaleri: detail['id_galeri'],
          keterangan: detail['keterangan'],
          tanggal: detail['tanggal'],
          area: detail['area'],
          isSuccess: true,
          message: 'Data loaded successfully',
        ));
      } else {
        throw Exception('Gagal memuat data: ${response.statusCode}');
      }
    } catch (error) {
      print('Kesalahan detail program bloc: $error');
      emit(state.copyWith(
          status: DetailProgramStateStatus.error,
          isSuccess: false,
          message: 'Error loading data'));
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