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
class ChangeData1 extends ValidateDataEvent {
  final String? value;

  ChangeData1({this.value});
}

class ChangeData2 extends ValidateDataEvent {
  final String? value;

  ChangeData2({this.value});
}

class ChangeData3 extends ValidateDataEvent {
  final String? value;

  ChangeData3({this.value});
}

class ChangeData4 extends ValidateDataEvent {
  final String? value;

  ChangeData4({this.value});
}

class ChangeData5 extends ValidateDataEvent {
  final String? value;

  ChangeData5({this.value});
}

class ChangeData6 extends ValidateDataEvent {
  final String? value;

  ChangeData6({this.value});
}

class ChangeData7 extends ValidateDataEvent {
  final String? value;

  ChangeData7({this.value});
}

class ChangeData8 extends ValidateDataEvent {
  final String? value;

  ChangeData8({this.value});
}
