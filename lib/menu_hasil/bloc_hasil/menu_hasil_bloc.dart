import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'menu_hasil_event.dart';
part 'menu_hasil_state.dart';

class MenuHasilBloc extends Bloc<MenuHasilEvent, MenuHasilState> {
  MenuHasilBloc() : super(MenuHasilInitial()) {
    on<MenuHasilEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
