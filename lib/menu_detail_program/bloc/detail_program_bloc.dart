import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'detail_program_event.dart';
part 'detail_program_state.dart';

// class DetailProgramBloc extends Bloc<DetailProgramEvent, DetailProgramState> {
//   DetailProgramBloc() : super(DetailProgramState(status: status)) {
//     on<OnDetailProgramView>(_validateDetailProgram);
//   }
// }
//
// FutureOr<void> _validateDetailProgram(OnDetailProgramView event, Emitter<DetailProgramState> emit) async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
// }