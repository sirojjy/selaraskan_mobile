import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'validate_data_event.dart';
part 'validate_data_state.dart';

class ValidateDataBloc extends Bloc<ValidateDataEvent, ValidateDataState> {
  ValidateDataBloc() : super(ValidateDataState()) {
    on<ValidateDataEvent>((event, emit) {
      if(event is ChangeImageFile){
        emit(state.copyWith(
          file: event.filePickData
        ));
      }else if(event is ChangeImageFileSesudah){
        emit(state.copyWith(
            fileSesudah: event.filePickData
        ));
      }else if(event is SubmitData){
        /// kerjain submit datanya di sini
        /// kalau yg mau di lempar harus file ubah dulu xfile jadi file
        /// cartanya gini File(state.file.path)
        final file = File('${state.file?.path}');
        final fileSesudah = File('${state.fileSesudah?.path}');
        /// tinggal hit a[pi upload, caranya sama kayak yg upload file dari gallery

        print('INI FILE PATH NYA $file');
        print('INI FILE PATH NYA $fileSesudah');
      }
    });
  }
}
