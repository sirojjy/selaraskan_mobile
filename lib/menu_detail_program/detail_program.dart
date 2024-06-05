import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaraskan_mobile/menu_detail_program/bloc/detail_program_bloc.dart';
import 'package:selaraskan_mobile/menu_detail_program/tambah_data.dart';
import 'package:selaraskan_mobile/menu_program/model/program_model.dart';
import 'package:intl/intl.dart';

class DetailProgram extends StatefulWidget {
  final ProgramModel data;

  const DetailProgram({super.key, required this.data});

  @override
  State<DetailProgram> createState() => _DetailProgramState();
}

class _DetailProgramState extends State<DetailProgram> {

  @override
  void initState() {
    super.initState();

    BlocProvider.of<DetailProgramBloc>(context).add(
        OnDetailProgramView(data: widget.data));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: BlocBuilder<DetailProgramBloc, DetailProgramState>(
            builder: (context, state) {
              String? namaProgram;
              if (state.idProgram == '4') { //Himbauan hemat energi dan air
                namaProgram = 'Himbauan hemat energi dan air';
              } else if (state.idProgram == '5') { // Patroli energi dan air
                namaProgram = 'Patroli energi dan air';
              } else if (state.idProgram == '7') { // Himbauan K3
                namaProgram = 'Himbauan K3';
              } else if (state.idProgram == '9') { // Patroli K3
                namaProgram = 'Patroli K3';
              } else if (state.idProgram == '11') { // Pembuatan sumur resapan/ biopori
                namaProgram = 'Pembuatan sumur resapan/ biopori';
              } else if (state.idProgram == '15') { // Upaya penambahan/pemeliharaan RTH di pelabuhan perikanan
                namaProgram = 'Upaya penambahan/pemeliharaan RTH di pelabuhan perikanan';
              } else if (state.idProgram == '43') { // Penggunaan lampu hemat energi
                namaProgram = 'Penggunaan lampu hemat energi';
              } else if (state.idProgram == '47') { // Pengukuran kualitas udara
                namaProgram = 'Pengukuran kualitas udara';
              } else if (state.idProgram == '48') { // Pengukuran kualitas air kolam pelabuhan
                namaProgram = 'Pengukuran kualitas air kolam pelabuhan';
              } else if (state.idProgram == '49') { // Pengukuran air limbah pelabuhan
                namaProgram = 'Pengukuran air limbah pelabuhan';
              } else if (state.idProgram == '51') { // Pengukuran volume sampah darat
                namaProgram = 'Pengukuran volume sampah darat';
              } else if (state.idProgram == '52') { // Pengukuran volume sampah laut
                namaProgram = 'Pengukuran volume sampah laut';
              } else if (state.idProgram == '53') { // Pemilahan sampah sesuai jenis
                namaProgram = 'Pemilahan sampah sesuai jenis';
              } else if (state.idProgram == '58') { // Penyediaan penampungan limbah B3
                namaProgram = 'Penyediaan penampungan limbah B3';
              } else if (state.idProgram == '60') { // Penilaian kepatuhan tenan
                namaProgram = 'Penilaian kepatuhan tenan';
              } else if (state.idProgram == '61') { // Pengangkutan/pendistribusian Sampah
                namaProgram = 'Pengangkutan/pendistribusian Sampah';
              } else if (state.idProgram == '64') { // Pelaksanaan sertifikasi dan surveillance ISO 14001
                namaProgram = 'Pelaksanaan sertifikasi dan surveillance ISO 14001';
              } else if (state.idProgram == '99') { // Pengolahan sampah
                namaProgram = 'Pengolahan sampah';
              } else if (state.idProgram == '100') { // Upload drone bulanan
                namaProgram = 'Upload drone bulanan';
              } else if (state.idProgram == '8') { // Membuat penampungan air hujan
                namaProgram = 'Membuat penampungan air hujan';
              } else if (state.idProgram == '45') { // Penggunaan energi baru terbarukan
                namaProgram = 'Penggunaan energi baru terbarukan';
              } else if (state.idProgram == '78') { // Pemeliharaan drainase
                namaProgram = 'Pemeliharaan drainase';
              } else if (state.idProgram == '90') { // Pembuatan sumur resapan/biopori
                namaProgram = 'Pembuatan sumur resapan/biopori';
              } else if (state.idProgram == '102') { // Pemeliharaan jalan
                namaProgram = 'Pemeliharaan jalan';
              } else if (state.idProgram == '103') { // Penyemprotan drainase TPI
                namaProgram = 'Penyemprotan drainase TPI';
              } else if (state.idProgram == '104') { // Pemeliharaan dermaga
                namaProgram = 'Pemeliharaan dermaga';
              } else if (state.idProgram == '105') { // Pemeliharaan kolam pelabuhan
                namaProgram = 'Pemeliharaan kolam pelabuhan';
              } else if (state.idProgram == '106') { // Pelaksanaan jumat bersih
                namaProgram = 'Pelaksanaan jumat bersih';
              } else if (state.idProgram == '107') { // Pengelolaan bank sampah
                namaProgram = 'Pengelolaan bank sampah';
              } else if (state.idProgram == '108') { // Uji emisi kendaraan
                namaProgram = 'Uji emisi kendaraan';
              } else if (state.idProgram == '109') { // Pengelolaan IPAL kawasan milik Pelabuhan Perikanan
                namaProgram = 'Pengelolaan IPAL kawasan milik Pelabuhan Perikanan';
              } else if (state.idProgram == '110') { // Pengelolaan IPAL penyewa tanah dan bangunan
                namaProgram = 'Pengelolaan IPAL penyewa tanah dan bangunan';
              } else if (state.idProgram == '111') { // Upaya pengurangan penggunaan kemasan plastik
                namaProgram = 'Upaya pengurangan penggunaan kemasan plastik';
              } else if (state.idProgram == '112') { // Pembuatan pupuk organik
                namaProgram = 'Pembuatan pupuk organik';
              } else if (state.idProgram == '113') { // Program pelatihan lingkungan
                namaProgram = 'Program pelatihan lingkungan';
              } else if (state.idProgram == '114') { // Koordinasi dengan stakeholder terkait pengendalian lingkungan
                namaProgram = 'Koordinasi dengan stakeholder terkait pengendalian lingkungan';
              } else {
                namaProgram = 'Detail Program';
              }
              return Text(namaProgram);
            },

          ),
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
                                  child:
                                  Image.network(data.fileSesudah!,
                                  width: 50,),
                                  // const Icon(
                                  //   Icons.image,
                                  //   color: Color(0xfff3478df),
                                  // ),
                                  onTap: () {},
                                ),
                                subtitle: Text('${data.keterangan}'),
                                title: GestureDetector(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Evidence ${data.tanggal}',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
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
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    'Keterangan: ${data.keterangan ?? 'N/A'}',
                                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  // Text(
                                                  //   'Tanggal: ${DateFormat('dd-mm-yyyy').format(DateTime.parse(data.tanggal ?? ''))}',
                                                  //   style: TextStyle(fontWeight: FontWeight.bold),
                                                  // ),
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
