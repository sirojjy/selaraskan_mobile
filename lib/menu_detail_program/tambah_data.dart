import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:selaraskan_mobile/menu_detail_program/bloc/detail_program_bloc.dart';
import 'package:selaraskan_mobile/menu_detail_program/validate_data_bloc/validate_data_bloc.dart';
import 'package:selaraskan_mobile/menu_program/model/program_model.dart';

class TambahData extends StatefulWidget {
  final ProgramModel data;
  const TambahData({super.key, required this.data});

  @override
  State<TambahData> createState() => _TambahDataState();
}

class _TambahDataState extends State<TambahData> {
  int _selectedArea = 1; // Default value
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<ValidateDataBloc>(context).add(SetIdProgram(
      idProgram: widget.data.idProgram,
      idDataProgram: widget.data.idDataProgram

    ));
  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Data'),
      ),
      body: BlocListener<ValidateDataBloc, ValidateDataState>(
        listener: (context, state){
          if(state.successUpload){
            Navigator.pop(context);

            BlocProvider.of<DetailProgramBloc>(context).add(OnDetailProgramView(data: widget.data));

          }
        },
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SafeArea(
            child: BlocBuilder<ValidateDataBloc, ValidateDataState>(
              builder: (context, state){
                return Column(
                  children: [
                    // TextFormField(
                    //   initialValue: state.area ?? '',
                    //   decoration: const InputDecoration(
                    //     labelText: 'Area',
                    //   ),
                    //   onChanged: (value){
                    //     BlocProvider.of<ValidateDataBloc>(context).add(ChangeArea(value: value));
                    //   },
                    // ),

                    // Add RadioListTile for "Area Pelabuhan"
                    RadioListTile<int>(
                      title: const Text('Kolam Pelabuhan'),
                      value: 1,
                      groupValue: _selectedArea,
                      onChanged: (value) {
                        setState(() {
                          _selectedArea = value!;
                          BlocProvider.of<ValidateDataBloc>(context).add(ChangeArea(value: value.toString()));
                        });
                      },
                    ),
                    // Add RadioListTile for "Kolam Pelabuhan"
                    RadioListTile<int>(
                      title: const Text('Area Daratan'),
                      value: 2,
                      groupValue: _selectedArea,
                      onChanged: (value) {
                        setState(() {
                          _selectedArea = value!;
                          BlocProvider.of<ValidateDataBloc>(context).add(ChangeArea(value: value.toString()));
                        });
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
                    const SizedBox(height: 15,),
                    MaterialButton(
                      color: const Color(0xff1a5ee5),
                      textColor: Colors.white,
                      onPressed: (){
                        _pickFileCamera();
                      },
                      child: const Text('Foto Sebelum'),
                    ),

                    Visibility(
                        visible: state.file != null,
                        child: Image.file(File('${state.file?.path}'), height: 100,)),
                    MaterialButton(
                      color: const Color(0xff1a5ee5),
                      textColor: Colors.white,
                      onPressed: (){
                        _pickFileCameraSesudah();
                      },
                      child: const Text('Foto Sesudah'),
                    ),
                    Visibility(
                        visible: state.fileSesudah != null,
                        child: Image.file(File('${state.fileSesudah?.path}'), height: 100,)),
                    const SizedBox(height: 20,),
                    MaterialButton(
                      color: const Color(0xff1a5ee5),
                      textColor: Colors.white,
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
