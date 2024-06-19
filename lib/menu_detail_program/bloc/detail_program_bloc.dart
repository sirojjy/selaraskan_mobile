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

      if(event.data?.idProgram == '4'){ /// Himbauan hemat energi dan air
        url = Uri.parse(ApiConstant.programHematEnergiAir);
      }else if(event.data?.idProgram == '5'){ /// Patroli energi dan air
        url = Uri.parse(ApiConstant.programPatroliEnergiAir);
      }else if(event.data?.idProgram == '7'){ ///  Himbauan K3
        url = Uri.parse(ApiConstant.programHimbauanK3);
      }else if(event.data?.idProgram == '9'){ /// Patroli K3
        url = Uri.parse(ApiConstant.programPatroliK3);
      }else if(event.data?.idProgram == '15'){ /// Upaya penambahan/pemeliharaan RTH di pelabuhan perikanan
        url = Uri.parse(ApiConstant.programPemeliharaanRTH);
      }else if(event.data?.idProgram == '43'){ /// Penggunaan lampu hemat energi
        url = Uri.parse(ApiConstant.programLampuHematEnergi);
      }else if(event.data?.idProgram == '47'){ /// Pengukuran kualitas udara
        url = Uri.parse(ApiConstant.programKualitasUdara);
      }else if(event.data?.idProgram == '48'){ /// Pengukuran kualitas air kolam pelabuhan
        url = Uri.parse(ApiConstant.programKualitasAir);
      }else if(event.data?.idProgram == '49'){ /// Pengukuran air limbah pelabuhan
        url = Uri.parse(ApiConstant.programLimbahIPAL);
      }else if(event.data?.idProgram == '51'){ /// Pengukuran volume sampah darat
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '52'){ /// Pengukuran volume sampah laut
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '53'){ /// Pemilahan sampah sesuai jenis
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '54'){ /// Kebersihan area pelabuhan
        url = Uri.parse(ApiConstant.programKebersihan);
      }else if(event.data?.idProgram == '58'){ /// Penyediaan penampungan limbah B3
        url = Uri.parse(ApiConstant.programLimbahB3);
      }else if(event.data?.idProgram == '60'){ /// Penilaian kepatuhan tenan
        url = Uri.parse(ApiConstant.programKepatuhanTenan);
      }else if(event.data?.idProgram == '61'){ /// Pengangkutan/pendistribusian Sampah
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '64'){ /// Pelaksanaan sertifikasi dan surveillance ISO 14001
        url = Uri.parse(ApiConstant.programSertifikasiISO);
      }else if(event.data?.idProgram == '99'){ /// Pengolahan sampah
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '100'){ /// Upload drone bulanan
        url = Uri.parse(ApiConstant.programUploadDrone);
        /// VOLUNTARY
      }else if(event.data?.idProgram == '8'){ ///  Membuat penampungan air hujan
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '45'){ /// Penggunaan energi baru terbarukan
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '78'){ /// Pemeliharaan drainase
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '90'){ /// Pembuatan sumur resapan/biopori
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '102'){ /// Pemeliharaan jalan
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '103'){ /// Penyemprotan drainase TPI
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '104'){ /// Pemeliharaan dermaga
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '105'){ /// Pemeliharaan kolam pelabuhan
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '106'){ /// Pelaksanaan jumat bersih
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '107'){ /// Pengelolaan bank sampah
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '108'){ /// Uji emisi kendaraan
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '109'){ /// Pengelolaan IPAL kawasan milik Pelabuhan Perikanan
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '110'){ /// Pengelolaan IPAL penyewa tanah dan bangunan
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '111'){ /// Upaya pengurangan penggunaan kemasan plastik
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '112'){ /// Pembuatan pupuk organik
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '113'){ /// Program pelatihan lingkungan
        url = Uri.parse(ApiConstant.programSampah);
      }else if(event.data?.idProgram == '114'){ /// Koordinasi dengan stakeholder terkait pengendalian lingkungan
        url = Uri.parse(ApiConstant.programSampah);
      } else {
        url = Uri.parse(ApiConstant.programKebersihan);
      }


      print('Mengirim permintaan ke URL: $url dengan id_pelabuhan: $idPelabuhan id_program: ${event.data?.idProgram} id_data_program ${event.data?.idDataProgram}');
      await prefs.setString('id_program', event.data?.idProgram ?? '');
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

        if (jsonResponse['data'] != null) {
          for (var i = 0; i < jsonResponse['data'].length; i++) {
            listData.add(DetailProgramModel(
                idPelabuhan: jsonResponse['data'][i]['id_pelabuhan'],
                keterangan: jsonResponse['data'][i]['keterangan'],
                file: jsonResponse['data'][i]['file'],
                tanggal: jsonResponse['data'][i]['tanggal'],
                fileSesudah: jsonResponse['data'][i]['foto_sesudah'],
                idProgram: jsonResponse['data'][i]['id_program'],
                area: jsonResponse['data'][i]['area'],
                indikator: jsonResponse['indikator'],
                // area: jsonResponse['data'][i]['area'],
            ));
                // idDataProgram: jsonResponse['data'][i]['id_data_program'],
          }
        }

        emit(state.copyWith(
            status: DetailProgramStateStatus.success, listProgram: listData));
      } else {
        if (response.statusCode == 404) {
          print('Data Kosong');
          throw Exception('Data Kosong');
        }

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
