part of 'validate_data_bloc.dart';

@immutable
abstract class ValidateDataEvent {

}

class ChangeImageFile extends ValidateDataEvent {
  final XFile? filePickData;

  ChangeImageFile({this.filePickData});
}

class ChangeImageFileSesudah extends ValidateDataEvent {
  final XFile? filePickData;

  ChangeImageFileSesudah({this.filePickData});
}

class SubmitData extends ValidateDataEvent {

}

class SetIdProgram extends ValidateDataEvent {
  final ProgramModel? data;
  final String? idProgram;
  final String? idDataProgram;

  SetIdProgram({this.idProgram, this.idDataProgram, this.data});
}

class ChangeArea extends ValidateDataEvent {
  final String? value;

  ChangeArea({this.value});
}

class ChangeKeterangan extends ValidateDataEvent {
  final String? value;

  ChangeKeterangan({this.value});
}

class ChangeSampahDarat extends ValidateDataEvent {
final String? value;

  ChangeSampahDarat({this.value});
}

class ChangeAreaString extends ValidateDataEvent {
  final String? value;

  ChangeAreaString({this.value});
}

