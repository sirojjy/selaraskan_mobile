import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaraskan_mobile/menu_detail_program/bloc/detail_program_bloc.dart';
import 'package:selaraskan_mobile/menu_detail_program/tambah_data.dart';
import 'package:selaraskan_mobile/menu_program/model/program_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailProgram extends StatefulWidget {
  final ProgramModel data;

  const DetailProgram({super.key, required this.data});

  @override
  State<DetailProgram> createState() => _DetailProgramState();
}

class _DetailProgramState extends State<DetailProgram> {
  SharedPreferences? pref;
  String? idProgramMaster;

  @override
  void initState() {
    getPref();
    super.initState();

    BlocProvider.of<DetailProgramBloc>(context).add(
        OnDetailProgramView(data: widget.data));
  }

  Future<void> getPref() async {
    pref = await SharedPreferences.getInstance();
    setState(() {
      idProgramMaster = pref?.getString('id_program');
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<DetailProgramBloc, DetailProgramState>(
        builder: (context, state) {
          if (state.status == DetailProgramStateStatus.loading) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          } else if (state.status == DetailProgramStateStatus.error) {
            return Scaffold(
              body: Center(child: Text('${state.message}')),
            );
          } else {
            print('ID PROGRAMNYA ${widget.data.idProgram}');
            return Scaffold(
              appBar: AppBar(
                title: Text(_getNamaProgram(widget.data.idProgram), style: const TextStyle(fontSize: 18),),
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
                            builder: (context) => TambahData(data: widget.data),
                          ),
                        );
                      },
                      child: const Text('+ Tambah'),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      if (state.listProgram != null)
                        ...state.listProgram!.map((data) {
                          return Card(
                            child: ListTile(
                              leading: GestureDetector(
                                child: Image.network(
                                  data.file ??
                                      'http://123.100.226.123:2904/assets/images/icon_image.png',
                                  width: 50,
                                ),
                                onTap: () {},
                              ),
                              subtitle: Text(data.keterangan ?? ''),
                              title: GestureDetector(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Data ${data.tanggal}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  _showEvidenceDialog(context, data);
                                },
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete_forever,
                                  color: Color(0xffce0808),
                                ),
                                onPressed: () {},
                              ),
                            ),
                          );
                        }).toList()
                      else
                        const Center(child: Text('Data Kosong')),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  String _getNamaProgram(String? indikator) {
    switch (indikator) {
      case '4':
        return 'Himbauan hemat energi dan air';
      case '5':
        return 'Patroli energi dan air';
      case '7':
        return 'Himbauan K3';
      case '9':
        return 'Patroli K3';
      case '11':
        return 'Pembuatan sumur resapan/ biopori';
      case '15':
        return 'Upaya penambahan/pemeliharaan RTH di pelabuhan perikanan';
      case '43':
        return 'Penggunaan lampu hemat energi';
      case '47':
        return 'Pengukuran kualitas udara';
      case '48':
        return 'Pengukuran kualitas air kolam pelabuhan';
      case '49':
        return 'Pengukuran air limbah pelabuhan';
      case '51':
        return 'Pengukuran volume sampah darat';
      case '52':
        return 'Pengukuran volume sampah laut';
      case '53':
        return 'Pemilahan sampah sesuai jenis';
      case '58':
        return 'Penyediaan penampungan limbah B3';
      case '60':
        return 'Penilaian kepatuhan tenan';
      case '61':
        return 'Pengangkutan/pendistribusian Sampah';
      case '64':
        return 'Pelaksanaan sertifikasi dan surveillance ISO 14001';
      case '99':
        return 'Pengolahan sampah';
      case '100':
        return 'Upload drone bulanan';
      case '8':
        return 'Membuat penampungan air hujan';
      case '45':
        return 'Penggunaan energi baru terbarukan';
      case '78':
        return 'Pemeliharaan drainase';
      case '90':
        return 'Pembuatan sumur resapan/biopori';
      case '102':
        return 'Pemeliharaan jalan';
      case '103':
        return 'Penyemprotan drainase TPI';
      case '104':
        return 'Pemeliharaan dermaga';
      case '105':
        return 'Pemeliharaan kolam pelabuhan';
      case '106':
        return 'Pelaksanaan jumat bersih';
      case '107':
        return 'Pengelolaan bank sampah';
      case '108':
        return 'Uji emisi kendaraan';
      case '109':
        return 'Pengelolaan IPAL kawasan milik Pelabuhan Perikanan';
      case '110':
        return 'Pengelolaan IPAL penyewa tanah dan bangunan';
      case '111':
        return 'Upaya pengurangan penggunaan kemasan plastik';
      case '112':
        return 'Pembuatan pupuk organik';
      case '113':
        return 'Program pelatihan lingkungan';
      case '114':
        return 'Koordinasi dengan stakeholder terkait pengendalian lingkungan';
      default:
        return 'Detail Program';
    }
  }

  void _showEvidenceDialog(BuildContext context, dynamic data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Evidence ${data.tanggal}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Keterangan: ${data.keterangan ?? 'N/A'}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Foto Sebelum:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  data.file != null
                      ? Image.network(data.file!)
                      : const Text('Tidak ada foto sebelum'),
                  const SizedBox(height: 10),
                  const Text(
                    'Foto Sesudah:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  data.fileSesudah != null
                      ? Image.network(data.fileSesudah!)
                      : const Text('Tidak ada foto sesudah'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
