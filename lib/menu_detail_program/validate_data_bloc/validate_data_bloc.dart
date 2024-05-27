import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:selaraskan_mobile/shared/shared_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

part 'validate_data_event.dart';
part 'validate_data_state.dart';

class ValidateDataBloc extends Bloc<ValidateDataEvent, ValidateDataState> {
  ValidateDataBloc() : super(ValidateDataState()) {
    on<ValidateDataEvent>((event, emit) async {
      if(event is ChangeImageFile){
        emit(state.copyWith(
          file: event.filePickData
        ));
      }else if(event is ChangeImageFileSesudah){
        emit(state.copyWith(
            fileSesudah: event.filePickData
        ));
      }else if(event is SetIdProgram){
        emit(state.copyWith(
            idProgram: event.idProgram
        ));
      } else if(event is ChangeArea){
        emit(state.copyWith(
            area: event.value
        ));
      } else if(event is ChangeKeterangan){
        emit(state.copyWith(
            keterangan: event.value
        ));
      } else if(event is SubmitData){
        /// kerjain submit datanya di sini
        /// kalau yg mau di lempar harus file ubah dulu xfile jadi file
        /// cartanya gini File(state.file.path)
        ///


        SharedPreferences prefs = await SharedPreferences.getInstance();
        final idPelabuhan = prefs.getString('id_pelabuhan');

        final file = File('${state.file?.path}');
        final fileSesudah = File('${state.fileSesudah?.path}');
        /// tinggal hit a[pi upload, caranya sama kayak yg upload file dari gallery

        var url = Uri.parse(ApiConstant.addProgramKebersihan);

        var request = http.MultipartRequest("POST", url);
        request.fields['id_pelabuhan'] = '$idPelabuhan';
        request.fields['id_data_program'] = '${state.idProgram}';
        request.fields['area'] = '${state.area}';
        request.fields['keterangan'] = '${state.keterangan}';
        request.fields['tanggal'] = '${DateTime.now()}';

        request.files.add(await http.MultipartFile.fromPath('file', file.path));
        request.files.add(await http.MultipartFile.fromPath('file_sesudah', fileSesudah.path));

        await request.send().then((response) {
          print('INI KANN $url ${idPelabuhan} ${state.idProgram} ${state.area} ${state.keterangan} ${DateTime.now()}');
          if (response.statusCode == 200)
            print("Uploaded! ${response.stream}");
        });

        emit(state.copyWith(
            successUpload: true
        ));

      }
    });
  }
}
