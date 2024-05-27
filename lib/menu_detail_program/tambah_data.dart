import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:selaraskan_mobile/menu_detail_program/validate_data_bloc/validate_data_bloc.dart';
import 'package:selaraskan_mobile/menu_program/model/program_model.dart';

class TambahData extends StatefulWidget {
  final ProgramModel data;
  const TambahData({super.key, required this.data});

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<ValidateDataBloc>(context).add(SetIdProgram(
      idProgram: widget.data.idProgram
    ));
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: BlocBuilder<ValidateDataBloc, ValidateDataState>(
            builder: (context, state){
              return Column(
                children: [
                  TextFormField(
                    initialValue: state.area ?? '',
                    decoration: const InputDecoration(
                      labelText: 'Area',
                    ),
                    onChanged: (value){
                      BlocProvider.of<ValidateDataBloc>(context).add(ChangeArea(value: value));
                    },
                  ),
                  TextFormField(
                    initialValue: state.keterangan ?? '',
                    decoration: const InputDecoration(
                      labelText: 'Keterangan',
                    ),
                    onChanged: (value){
                      BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));
                    },
                  ),
                  MaterialButton(
                    onPressed: (){
                      _pickFileCamera();
                    },
                    child: Text('File'),
                  ),
                  Visibility(
                    visible: state.file != null,
                    child: Image.file(File('${state.file?.path}'), height: 100,)),
                  MaterialButton(
                    onPressed: (){
                      _pickFileCameraSesudah();
                    },
                    child: Text('File Sesudah'),
                  ),
                  Visibility(
                      visible: state.fileSesudah != null,
                      child: Image.file(File('${state.fileSesudah?.path}'), height: 100,)),
                  MaterialButton(
                    onPressed: (){
                      BlocProvider.of<ValidateDataBloc>(context).add(SubmitData());
                    },
                    child: const Text('Submit'),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _pickFileCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    BlocProvider.of<ValidateDataBloc>(context).add(ChangeImageFile(filePickData: pickedFile));
  }

  void _pickFileCameraSesudah() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    BlocProvider.of<ValidateDataBloc>(context).add(ChangeImageFileSesudah(filePickData: pickedFile));
  }
}
