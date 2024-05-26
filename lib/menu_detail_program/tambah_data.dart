import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:selaraskan_mobile/menu_detail_program/validate_data_bloc/validate_data_bloc.dart';

class TambahData extends StatefulWidget {
  const TambahData({super.key});

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {

  final ImagePicker _picker = ImagePicker();

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
                    decoration: const InputDecoration(
                      labelText: 'Id Pelabuhan',
                    ),
                    onChanged: (value){

                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Id Data Program',
                    ),
                    onChanged: (value){

                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Area',
                    ),
                    onChanged: (value){

                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Keterangan',
                    ),
                    onChanged: (value){

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
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Tanggal',
                    ),
                    onChanged: (value){

                    },
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Create Data',
                    ),
                    onChanged: (value){

                    },
                  ),
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
