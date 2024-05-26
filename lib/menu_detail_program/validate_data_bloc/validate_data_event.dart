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
