part of 'validate_data_bloc.dart';

@immutable
abstract class ValidateDataEvent {}

class ChangeImageFile extends ValidateDataEvent {
  final XFile? filePickData;

  ChangeImageFile({this.filePickData});
}

class ChangeImageFileSesudah extends ValidateDataEvent {
  final XFile? filePickData;

  ChangeImageFileSesudah({this.filePickData});
}

class SubmitData extends ValidateDataEvent {}

class SetIdProgram extends ValidateDataEvent {
  final String? idProgram;

  SetIdProgram({this.idProgram});
}

class ChangeArea extends ValidateDataEvent {
  final String? value;

  ChangeArea({this.value});
}

class ChangeKeterangan extends ValidateDataEvent {
  final String? value;

  ChangeKeterangan({this.value});
}

