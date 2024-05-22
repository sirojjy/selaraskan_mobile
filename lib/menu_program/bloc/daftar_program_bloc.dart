import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:selaraskan_mobile/shared/shared_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/program_model.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

part 'daftar_program_event.dart';
part 'daftar_program_state.dart';

class DaftarProgramBloc extends Bloc<DaftarProgramEvent, DaftarProgramState> {
  DaftarProgramBloc() : super(DaftarProgramState(dataProgram: [])) {
    on<OnViewProgram>(_daftarProgramView);
  }

  Future<void> _daftarProgramView(
      OnViewProgram event, Emitter<DaftarProgramState> emitter) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var dataProgram = <ProgramModel>[];

    emit(state.copyWith(status: DaftarProgramStateStatus.loading));
    try {
      // Memastikan id_pelabuhan ada di SharedPreferences
      String? idPelabuhan = prefs.getString('id_pelabuhan');
      if (idPelabuhan == null) {
        throw Exception('id_pelabuhan tidak ditemukan di SharedPreferences');
      }

      var url = Uri.parse(ApiConstant.programLingkungan);
      // print('Mengirim permintaan ke URL: $url dengan id_pelabuhan: $idPelabuhan');

      var response = await http.post(
        url,
        body: {'id_pelabuhan': idPelabuhan},  // Hapus spasi di akhir kunci
      );

      // print('Status respons: ${response.statusCode}');
      // print('Body respons: ${response.body}');

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        var progLingkungan = jsonResponse['progLingkungan'];
        for (var item in progLingkungan) {
          dataProgram.add(ProgramModel(
            idProgram: item['id_data_program'],
            namaProgram: item['program'],
            jenisProgram: item['kategori_program'],
            jadwal: item['periode'],
            score: double.tryParse(item['skor']),
          ));
        }
        emit(state.copyWith(
            status: DaftarProgramStateStatus.success,
            dataProgram: dataProgram));
      } else {
        throw Exception('Gagal memuat data: ${response.statusCode}');
      }
    } catch (error) {
      print('Kesalahan daftar program bloc: $error');
      emit(state.copyWith(
          status: DaftarProgramStateStatus.error, dataProgram: dataProgram));
    }
  }
}
