import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../shared/shared_api.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState()) {
    on<OnLoginEvent>(_loginValidation);
  }

  Future<void> _loginValidation(OnLoginEvent event, Emitter<AuthState> emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    emit(
      state.copyWith(
        status: AuthStateStatus.loading
      )
    );
    try{
      if(event.username == '' && event.password == '') {
        emit(
          state.copyWith(
            status: AuthStateStatus.error,
            message: 'Username atau Password tidak boleh kosong',
          )
        );
      } else {
        var url = Uri.parse(ApiConstant.authentication);
        var request = await http.post(
          url,
          body: {
            'param' : event.param,
            'username' : event.username,
            'password' : event.password,
          }
        );
        var response = jsonDecode(request.body);
        if(response['status'] == 'fail'){
          emit(
            state.copyWith(
              message: response ['error_msg'],
              status: AuthStateStatus.error,
            )
          );
        } else {
          emit (
            state.copyWith(
              status: AuthStateStatus.success,
            )
          );
          await prefs.setString('id', response['id']);
          await prefs.setString('nama', response['nama']);
          await prefs.setString('id_pelabuhan', response['id_pelabuhan']);
          // print('ID pelabuhan : ${prefs.getString('id_pelabuhan')}');
        }
      }
    } catch (error, stacktrace){
      emit(
        state.copyWith(
          status: AuthStateStatus.error
        )
      );
    }
  }
}


