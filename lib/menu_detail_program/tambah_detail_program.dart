import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TambahData extends StatefulWidget {
  TambahData({super.key});

  @override
  State<TambahData> createState() => _TambahDataState();

  TextEditingController _namaPetugasController = TextEditingController();
  TextEditingController _jabatanController = TextEditingController();
}

class _TambahDataState extends State<TambahData> {
  File? _selectedImage;
  File? _selectedImageSesudah;
  final ImagePicker _picker = ImagePicker();

  int _selectedArea = 1; // Variabel untuk menyimpan pilihan radio button

  Future<void> _pickImageFromGallery(bool isSebelum) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (isSebelum) {
        _selectedImage = pickedFile != null ? File(pickedFile.path) : null;
      } else {
        _selectedImageSesudah = pickedFile != null ? File(pickedFile.path) : null;
      }
    });
  }

  Future<void> _pickImageFromCamera(bool isSebelum) async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (isSebelum) {
        _selectedImage = pickedFile != null ? File(pickedFile.path) : null;
      } else {
        _selectedImageSesudah = pickedFile != null ? File(pickedFile.path) : null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tambah Data Evidence'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Tambah Data'),

                // Upload Foto Sebelum
                const Text('Upload Foto Sebelum'),
                const SizedBox(height: 20),
                _selectedImage != null
                    ? Image.file(_selectedImage!)
                    : const Text('Silakan Pilih Foto Sebelum'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _pickImageFromGallery(true),
                      child: const Text('Galeri'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => _pickImageFromCamera(true),
                      child: const Text('Kamera'),
                    ),
                  ],
                ),

                // Upload Foto Sesudah
                const SizedBox(height: 20),
                const Text('Upload Foto Sesudah'),
                _selectedImageSesudah != null
                    ? Image.file(_selectedImageSesudah!)
                    : const Text('Silakan Pilih Foto Sesudah'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => _pickImageFromGallery(false),
                      child: const Text('Galeri'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => _pickImageFromCamera(false),
                      child: const Text('Kamera'),
                    ),
                  ],
                ),

                const SizedBox(height: 20),
                // Radio buttons for Area
                const Text('Pilih Area'),
                RadioListTile<int>(
                  title: const Text('Kolam Pelabuhan'),
                  value: 1,
                  groupValue: _selectedArea,
                  onChanged: (value) {
                    setState(() {
                      _selectedArea = value!;
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
                    });
                  },
                ),

                const SizedBox(height: 20),
                // Keterangan
                TextField(
                  controller: widget._jabatanController,
                  decoration: const InputDecoration(labelText: 'Keterangan'),
                ),

                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff007BFF),
                        ),
                        child: const Text(
                          'Upload',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          // Logika untuk upload data
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        child: const Text('Cancel'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
