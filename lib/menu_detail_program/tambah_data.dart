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
  int _selectedArea = 0; // Default value
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<ValidateDataBloc>(context).add(SetIdProgram(
        idProgram: widget.data.idProgram,
        idDataProgram: widget.data.idDataProgram));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tambah Data'),
        ),
        body: BlocListener<ValidateDataBloc, ValidateDataState>(
          listener: (context, state) {
            if (state.successUpload) {
              Navigator.pop(context);

              BlocProvider.of<DetailProgramBloc>(context)
                  .add(OnDetailProgramView(data: widget.data));
            }
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: BlocBuilder<ValidateDataBloc, ValidateDataState>(
                builder: (context, state) {
                  Widget formContent;
                  switch (widget.data.idProgram) {
                    case '4': // Hemat Energi
                      formContent = _buildHematEnergiForm(state);
                      break;

                    case '5': // Patroli Energi
                      formContent = _buildPatroliEnergiForm(state);
                      break;

                    case '7': // Himbauan K3
                      formContent = _buildHimbauanK3Form(state);
                      break;

                    case '9': // Patroli K3
                      formContent = _buildPatroliK3Form(state);
                      break;

                    case '15': // RTH
                      formContent = _buildRTHForm(state);
                      break;

                    case '43': // Lampu
                      formContent = _buildLampuForm(state);
                      break;

                    case '47': // Kualitas Udara
                      formContent = _buildKualitasUdaraForm(state);
                      break;

                    case '48': // Kualitas Air
                      formContent = _buildKualitasAirForm(state);
                      break;

                    case '49': // Air Limbah
                      formContent = _buildAirLimbahForm(state);
                      break;

                    case '51': // Volume Sampah Darat
                      formContent = _buildSampahDaratForm(state);
                      break;

                    case '52': // Sampah Laut
                      formContent = _buildSampahLautForm(state);
                      break;

                    case '53': // Pemilahan Sampah
                      formContent = _buildPemilahanSampahForm(state);
                      break;

                    case '54': // Kebersihan Pelabuhan
                      formContent = _buildKebersihanPelabuhanForm(state);
                      break;

                    case '58': // Limbah B3
                      formContent = _buildLimbahB3Form(state);
                      break;

                    case '60': // Tenan
                      formContent = _buildTenanForm(state);
                      break;

                    case '64': // ISO
                      formContent = _buildISOForm(state);
                      break;

                    case '99': // Pengolahan Sampah
                      formContent = _buildPengolahanSampahForm(state);
                      break;

                    case '100': // Drone
                      formContent = _buildDroneForm(state);
                      break;

                    default:
                      formContent = const Center(
                          child: Text('Tidak ada input foto diperlukan'));
                      break;
                  }

                  return Column(
                    children: [
                      // Text('ID DATA PROGRAM ${state.idProgram ?? ''}'),
                      // Text('ID DATA PROGRAM ${widget.data.idProgram ?? ''}'),
                      // Add RadioListTile for "Area Pelabuhan"

                      formContent,
                      const SizedBox(height: 20),
                      MaterialButton(
                        color: const Color(0xff1a5ee5),
                        textColor: Colors.white,
                        onPressed: () {BlocProvider.of<ValidateDataBloc>(context).add(SubmitData());},
                        child: const Text('Submit Data'),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _pickFile(ImageSource source, {required bool isBefore}) async {
    final pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      if (isBefore) {
        BlocProvider.of<ValidateDataBloc>(context).add(ChangeImageFile(filePickData: pickedFile));
      } else {
        BlocProvider.of<ValidateDataBloc>(context).add(ChangeImageFileSesudah(filePickData: pickedFile));
      }
    }
  }

  Widget _buildHematEnergiForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Himbauan hemat energi dan air', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('4/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.area ?? '',
          decoration: const InputDecoration(labelText: 'Area',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeArea(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPatroliEnergiForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('5/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHimbauanK3Form(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('7/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPatroliK3Form(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('9/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRTHForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('15/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLampuForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('43/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildKualitasUdaraForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('43/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildKualitasAirForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('48/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAirLimbahForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('48/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  // Contoh method _buildSampahDaratForm
  Widget _buildSampahDaratForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('51/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSampahLautForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('52/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPemilahanSampahForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('53/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

// Contoh method _buildKebersihanPelabuhanForm
  Widget _buildKebersihanPelabuhanForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Kebersihan Area Pelabuhan', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('54/${widget.data.idProgram}'),
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
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {
            BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));
          },
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto Sebelum')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.file != null,
          child: Image.file(File('${state.file?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: true),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: true),
              child: const Text('Galeri'),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto Sesudah')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLimbahB3Form(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('58/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTenanForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('60/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildISOForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengukuran Volume Sampah Darat', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('64/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPengolahanSampahForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Pengolahan Sampah', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('99/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildDroneForm(state) {
    return Column(
      children: [
        const Center(
          child: Text('Drone', style: TextStyle(fontSize: 20),
            overflow: TextOverflow.visible,
            maxLines: 2,
            softWrap: true,
          ),
        ),
        Text('100/${widget.data.idProgram}'),
        TextFormField(
          initialValue: state.sampahDarat ?? '',
          decoration: const InputDecoration(labelText: 'Jumlah Sampah',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeSampahDarat(value: value));},
        ),
        TextFormField(
          initialValue: state.keterangan ?? '',
          decoration: const InputDecoration(labelText: 'Keterangan',),
          onChanged: (value) {BlocProvider.of<ValidateDataBloc>(context).add(ChangeKeterangan(value: value));},
        ),
        const SizedBox(height: 20),
        const Center(child: Text('Foto')),
        const SizedBox(height: 10),
        Visibility(
          visible: state.fileSesudah != null,
          child: Image.file(File('${state.fileSesudah?.path}'), height: 100),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.camera, isBefore: false),
              child: const Text('Kamera'),
            ),
            const SizedBox(width: 10),
            MaterialButton(
              color: const Color(0xff1a5ee5),
              textColor: Colors.white,
              onPressed: () => _pickFile(ImageSource.gallery, isBefore: false),
              child: const Text('Galeri'),
            ),
          ],
        ),
      ],
    );
  }
}


// void _pickFileCamera() async {
//   final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//   BlocProvider.of<ValidateDataBloc>(context).add(ChangeImageFile(filePickData: pickedFile));
// }
//
// void _pickFileCameraSesudah() async {
//   final pickedFile = await _picker.pickImage(source: ImageSource.camera);
//   BlocProvider.of<ValidateDataBloc>(context).add(ChangeImageFileSesudah(filePickData: pickedFile));
// }
