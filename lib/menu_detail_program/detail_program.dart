import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:selaraskan_mobile/menu_detail_program/bloc/detail_program_bloc.dart';
import 'package:selaraskan_mobile/menu_detail_program/tambah_data.dart';
import 'package:selaraskan_mobile/menu_program/model/program_model.dart';

class DetailProgram extends StatefulWidget {
  final ProgramModel data;

  const DetailProgram({super.key, required this.data});

  @override
  State<DetailProgram> createState() => _DetailProgramState();
}

class _DetailProgramState extends State<DetailProgram> {
  // TextEditingController _namaPetugasController = TextEditingController();
  // TextEditingController _jabatanController = TextEditingController();

  // String _fotoSesudahPath = "";

  /// Method to handle photo selection
  // void _selectPhoto(bool isBefore) {
  /// Code to select photo from device's gallery
  /// and save its path to _fotoSebelumPath or _fotoSesudahPath based on isBefore value
  // }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<DetailProgramBloc>(context)
        .add(OnDetailProgramView(idDataProgram: widget.data.idProgram));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Program Kebersihan'),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: MaterialButton(
                color: const Color(0xff1a5ee5),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => TambahData(data: widget.data)));
                  // if(widget.data.idProgram == '2920'){
                  //
                  // }else if(widget.data.idProgram == '2921'){
                  //   /// ke form lain
                  // }
                },
                child: const Text('+ Tambah Data'),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: BlocBuilder<DetailProgramBloc, DetailProgramState>(
              builder: (context, state) {
                if (state.status == DetailProgramStateStatus.error) {
                  return Text('${state.message}');
                } else if (state.status == DetailProgramStateStatus.loading) {
                  return const CircularProgressIndicator();
                } else {
                  if (state.listProgram != null) {
                    return Column(
                      children: [
                        for (var data in state.listProgram!)
                          Card(
                            child: ListTile(
                                leading: GestureDetector(
                                  child: const Icon(
                                    Icons.image,
                                    color: Color(0xfff3478df),
                                  ),
                                  onTap: () {},
                                ),
                                subtitle: Text('${data.keterangan}'),
                                title: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Evidence ${data.tanggal}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),

                                      // Text('${state.data[index].jenisDok}', style: const TextStyle(fontSize: 14),),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: SizedBox(
                                                    height: 50,
                                                    child: Text('${data.file}'),
                                                  ),
                                                )));
                                  },
                                ),
                                // subtitle: Text('${state.data[index].jenisDok}'),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete_forever,
                                        color: Color(0xffce0808),
                                      ),
                                      onPressed: () {},
                                    ),
                                  ],
                                )),
                          ),
                      ],
                    );
                  } else {
                    return const Text('Data Kosong');
                  }
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
