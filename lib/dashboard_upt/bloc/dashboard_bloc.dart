import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:selaraskan_mobile/shared/shared_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardState()) {
    on<OnDashboardEvent>(_validateToDashboard);
    on<OnDashboardMenuChanged>(_changeIndex);
  }

  /// ditkp2022
  FutureOr<void> _validateToDashboard(
      OnDashboardEvent event, Emitter<DashboardState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(state.copyWith(status: DashboardStateStatus.loading));
    // try {
    //   var url = Uri.parse('http://123.100.226.123:2904/Api/dashboard_pelabuhan/1');
    //   var response = await http.post(url, body: {
    //     'id_pelabuhan': idPelabuhan,
    //     // 'level': prefs.getString('level'), // Uncomment if needed
    //   });
    //
    //   if (response.statusCode == 200) {
    //     var responseBody = jsonDecode(response.body);
    //     print('Response: $responseBody');
    //
    //     if (responseBody['status'] == 'fail') {
    //       // Handle the error state
    //       print('Failed to fetch data: ${responseBody['message']}');
    //       // Update the state accordingly if using a state management solution
    //     } else {
    //       // Handle the success state
    //       print('Success: ${responseBody['data']}');
    //       // Update the state accordingly if using a state management solution
    //     }
    //   } else {
    //     print('Request failed with status: ${response.statusCode}');
    //   }
    // } catch (e) {
    //   print('Error occurred: $e');
    // }

    try {
      var url = Uri.parse(ApiConstant.dashboardUPT);
      // var url = Uri.parse('http://123.100.226.123:2904/Api/dashboard_pelabuhan');
      var request = await http.post(url, body: {
        'id_pelabuhan': prefs.getString('id_pelabuhan'),

      });

      var response = jsonDecode(request.body);
      // print('Dashboard bloc print nama klien ${response['nama']}');
      if (response == null) {
        emit(state.copyWith(
          message: response['error_msg'],
          status: DashboardStateStatus.error,
        ));
      } else {
        emit(state.copyWith(
          status: DashboardStateStatus.success,
          nama: response['nama'],
          score: response['scrTotal'],
          totalProgram: response['jumlah_program'],
          programSelesai: response['program_selesai'],
          programBelum: response['program_belum'],
          jmlProgramMandatori: response['jumlah_program_m'],
          jmlProgramVoluntary: response['jumlah_program_v'],
          linkLokasi: response['link_lokasi'],
          totalSampah: response['total_sampah'],
          sampahDarat: response['sampah_darat'],
          sampahDaratOrganik: response['sampah_darat_organik'],
          sampahDaratAnorganik: response['sampah_darat_anorganik'],
          sampahLaut: response['sampah_laut'],
          sampahLautOrganik: response['sampah_laut_organik'],
          sampahLautAnorganik: response['sampah_laut_anorganik'],
          sampahDiolah: response['sampah_olah'],
          listrikJanuari: response['l_jan'],
          listrikFebruari: response['l_feb'],
          listrikMaret: response['l_mar'],
          listrikApril: response['l_apr'],
          listrikMei: response['l_mei'],
          listrikJuni: response['l_jun'],
          listrikJuli: response['l_jul'],
          listrikAgustus: response['l_agu'],
          listrikSeptember: response['l_sep'],
          listrikOktober: response['l_okt'],
          listrikNovember: response['l_nov'],
          listrikDesember: response['l_des'],
          airJanuari: response['a_jan'],
          airFebruari: response['a_feb'],
          airMaret: response['a_mar'],
          airApril: response['a_apr'],
          airMei: response['a_mei'],
          airJuni: response['a_jun'],
          airJuli: response['a_jul'],
          airAgustus: response['a_agu'],
          airSeptember: response['a_sep'],
          airOktober: response['a_okt'],
          airNovember: response['a_nov'],
          airDesember: response['a_des'],
        ));
        print('CEK DATA DASHBOARD: ${state.score}');
      }
    } catch (error, stackTrace) {
      emit(state.copyWith(status: DashboardStateStatus.error));
      print('print error: $error');
      // print('Stack trace: $stackTrace');
    }
  }

  FutureOr<void> _changeIndex(OnDashboardMenuChanged event, Emitter<DashboardState> emit) {
    emit(
      state.copyWith(
        indexMenu: event.index
      )
    );
  }
}






/// test json decode
// var jsonData = {
//   "scrTotal": 77.2,
//   "nama": "PELABUHAN PERIKANAN NUSANTARA PALABUHAN RATU",
//   "jumlah_program": "25",
//   "program_selesai": "1",
//   "program_belum": "24",
//   "jml_program_mandatori": "18",
//   "jml_program_voluntary": "7",
//   "id_profil": "1",
//   "id_pelabuhan": "1",
//   "alamat": "Jl. Siliwangi No.57, Palabuhanratu, Kab. Sukabumi",
//   "link_lokasi": "https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3960.1810674447515!2d106.54177981477976!3d-6.987941270375514!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x2e682792ca3b72ad%3A0xf30ed9f96fa2b709!2sPelabuhan%20Perikanan%20Nusantara%20(PPN)!5e0!3m2!1sid!2sid!4v1652255070593!5m2!1sid!2sid",
//   "email": "ppn.palabuhanratu@kkp.go.id",
// };
// String jsonString = jsonEncode(jsonData);
// print('JSON String: $jsonString');
//
// // Decode JSON String ke Dart Object
// var response = jsonDecode(jsonString);
// print('Decoded JSON: $response');