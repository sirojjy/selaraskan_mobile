import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class FormDaftarProgram extends StatefulWidget {
  const FormDaftarProgram({super.key});

  @override
  State<FormDaftarProgram> createState() => _FormDaftarProgramState();
}

class _FormDaftarProgramState extends State<FormDaftarProgram> {
  /// Controllers for text fields
  TextEditingController _namaPetugasController = TextEditingController();
  TextEditingController _jabatanController = TextEditingController();

  String _fotoSesudahPath = "";

  /// Method to handle photo selection
  void _selectPhoto(bool isBefore) {
    /// Code to select photo from device's gallery
    /// and save its path to _fotoSebelumPath or _fotoSesudahPath based on isBefore value
  }

  ///image

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Kebersihan Pelabuhan'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              GestureDetector(
                child: Image.asset('assets/foto/data_evidence.png'),
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        // height: 200,
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              const Text('Tambah Data'),

                              // Upload Foto Sebelum
                              const Text('Upload Foto Sebelum'),
                              const SizedBox(
                                height: 20,
                              ),
                              // _selectedImage != null ? Image.file(_selectedImage!) : Text('Please Select Image'),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        _pickImageFromGalery();
                                      },
                                      child: const Text('Galeri')),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () => {},
                                    child: const Text('Kamera'),
                                  ),
                                ],
                              ),

                              // Upload Foto Sesudah
                              const Text('Upload Foto Sesudah'),
                              ElevatedButton(
                                onPressed: () => _selectPhoto(false),
                                child: const Text('Pilih Foto Sesudah'),
                              ),
                              _fotoSesudahPath.isNotEmpty
                                  ? Image.asset(
                                      _fotoSesudahPath) // Preview Foto Sesudah
                                  : const SizedBox(),

                              // Nama Petugas
                              TextField(
                                controller: _namaPetugasController,
                                decoration: const InputDecoration(
                                    labelText: 'Nama Petugas'),
                              ),

                              // Jabatan
                              TextField(
                                controller: _jabatanController,
                                decoration:
                                    const InputDecoration(labelText: 'Jabatan'),
                              ),

                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color(0xff007BFF)),
                                        child: const Text(
                                          'Upload',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        child: const Text('Cancel'),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ),
                                  ]),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }

  Future _pickImageFromGalery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      // _selectedImage = File(returnedImage!.path);
    });
  }
}
