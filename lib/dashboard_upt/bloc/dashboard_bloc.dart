import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:selaraskan_mobile/shared/shared_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    on<OnDashboardEvent>(_validateToDashboard);
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
      var url = Uri.parse(ApiConstant.dashboardKlien);
      // var url = Uri.parse('http://123.100.226.123:2904/Api/dashboard_pelabuhan');
      var request = await http.post(url, body: {
        'id_pelabuhan': prefs.getString('id_pelabuhan'),

      });
      // print('Dashboard bloc id pelabuhan : ${prefs.getString('id_pelabuhan')}');

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
          jmlProgramMandatori: response['jml_program_mandatori'],
          jmlProgramVoluntary: response['jml_program_voluntary'],
          linkLokasi: response['link_lokasi'],
          sampahDarat: response['sampah_darat'],
          sampahDaratOrganik: response['sampah_darat_organik'],
          sampahDaratAnorganik: response['sampah_darat_anorganik'],
          sampahLaut: response['sampah_laut'],
          sampahLautOrganik: response['sampah_laut_organik'],
          sampahLautAnorganik: response['sampah_laut_anorganik'],
          listrikJanuari: response['listrik_jan'],
          listrikFebruari: response['listrik_feb'],
          listrikMaret: response['listrik_mar'],
          listrikApril: response['listrik_apr'],
          listrikMei: response['listrik_mei'],
          listrikJuni: response['listrik_jun'],
          listrikJuli: response['listrik_jul'],
          listrikAgustus: response['listrik_agu'],
          listrikSeptember: response['listrik_sep'],
          listrikOktober: response['listrik_okt'],
          listrikNovember: response['listrik_nov'],
          listrikDesember: response['listrik_des'],
          airJanuari: response['air_jan'],
          airFebruari: response['air_feb'],
          airMaret: response['air_mar'],
          airApril: response['air_apr'],
          airMei: response['air_mei'],
          airJuni: response['air_jun'],
          airJuli: response['air_jul'],
          airAgustus: response['air_agu'],
          airSeptember: response['air_sep'],
          airOktober: response['air_okt'],
          airNovember: response['air_nov'],
          airDesember: response['air_des'],

        ));
      }
    } catch (error, stackTrace) {
      emit(state.copyWith(status: DashboardStateStatus.error));
      print('print error: $error');
      // print('Stack trace: $stackTrace');
    }
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