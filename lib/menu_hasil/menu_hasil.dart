import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaraskan_mobile/menu_program/bloc/daftar_program_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/bottom_menu.dart';
import '../menu_detail_program/detail_program.dart';

class DaftarProgram extends StatefulWidget {
  const DaftarProgram({super.key});

  @override
  State<DaftarProgram> createState() => _DaftarProgramState();
}

class _DaftarProgramState extends State<DaftarProgram> {
  SharedPreferences? prefs;

  @override
  void initState(){
    BlocProvider.of<DaftarProgramBloc>(context).add(OnViewProgram());
    getPref();
  }
  void getPref () async {
    prefs = await SharedPreferences.getInstance();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DaftarProgramBloc, DaftarProgramState>(
      builder: (context, state){
        IconData getIconByProgramId(String idProgram) {
          switch (idProgram) {
            case '103':
              return Icons.abc;
            case '49':
              return Icons.add_alert;
            case '43':
              return Icons.delete;
            case '9':
              return Icons.water;
            default:
              return Icons.account_tree;
          }
        }

        print('Jumlah Data Program : ${state.dataProgram.length}');
        return ListView.builder(
          itemCount: state.dataProgram.length,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            String idProgram = '${state.dataProgram[index].idProgram}';
            IconData iconData = getIconByProgramId(idProgram);
            // String formattedScore = state.dataProgram[index].score?.toStringAsFixed(1) ?? "0.0";


            return ListTile(
              title: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(

                          ///KIRIM ID DATA PROGRAM
                            builder: (context) => DetailProgram(data: state.dataProgram[index])));
                  },
                  child: Column(
                    children: [
                      Container(
                        padding:  EdgeInsets.only(top: 3, bottom: 3),
                        child: Row(
                          children: [
                            SizedBox(
                              child: Icon(
                                iconData,
                                color: Color(0xfff3478DF),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Text(
                                '${state.dataProgram[index].namaProgram}',
                                style: const TextStyle(fontWeight: FontWeight.w700, color: Color(0xfff3478DF)),
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5),
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Color(0xfff3478df),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  'Program',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  state.dataProgram[index].jenisProgram == '1' ? 'Mandatory' :
                                  state.dataProgram[index].jenisProgram == '2' ? 'Voluntary' : 'N/A',
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Jadwal',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '${state.dataProgram[index].jadwal}',
                                  style: const TextStyle(color: Colors.white),
                                ), // Convert DateTime to string
                              ],
                            ),
                            Column(
                              children: [
                                const Text(
                                  'Score',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  '${state.dataProgram[index].score?.toStringAsFixed(1)}',
                                  style: const TextStyle(color: Colors.white),
                                ), // Convert int to string
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },

        );
      },

    );
    //   Scaffold(
    //   appBar: AppBar(title: const Text('Daftar Program')),
    //   backgroundColor: const Color(0xfffe6f2f9),
    //
    //   body: ,
    // );
  }




  Map<String, IconData> iconMap = {
    '1': Icons.cleaning_services,
    '2': Icons.electric_bolt,
    '3': Icons.air,
    '4': Icons.delete,
    '5': Icons.delete_sweep,
    '6': Icons.wind_power,
    '7': Icons.forest,
    '8': Icons.water_drop_rounded,
    '9': Icons.warning_sharp,
    '10': Icons.light_outlined,
    '11': Icons.light_mode,
    '12': Icons.energy_savings_leaf,
    '13': Icons.water,
    '14': Icons.water_drop_outlined,
    '15': Icons.airplane_ticket,
    '16': Icons.dangerous,
    '17': Icons.account_tree,
    '18': Icons.file_open,
  };
//
// // Assuming all lists have the same length
// List<String> icons = [
//   '1',
//   '2',
//   '3',
//   '4',
//   '5',
//   '6',
//   '7',
//   '8',
//   '9',
//   '10',
//   '11',
//   '12',
//   '13',
//   '14',
//   '15',
//   '16',
//   '17',
//   '18',
// ];
// List<String> namaProgram = [
//   'Kebersihan Pelabuhan',
//   'Pengukuran Volumen Sampah Darat',
//   'Pengukuran Volumen Sampah Laut',
//   'Pemilahan Sampah',
//   'Pengelolaan Sampah',
//   'Pengukuran Kualitas Udara',
//   'RTH',
//   'Pengukuran Kualitas Air Kolam',
//   'Pengukuran Air Limbah',
//   'Penggunaan Lampu Hemat Energi',
//   'Himbauan Hemat Energi',
//   'Patroli Energi',
//   'Himbauan Hemat Air',
//   'Patroli Air',
//   'Drone',
//   'Penampungan Limbah B3',
//   'Kepatuhan Tenan',
//   'Pelaksanaan Sertifikasi & Surveillance',
// ];
// List<String> jenisProgram = [
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
//   'Mandatory',
// ];
// List<String> jadwal = [
//   'Harian',
//   'Harian',
//   'Harian',
//   'Harian',
//   'Mingguan',
//   'Bulanan',
//   'Mingguan',
//   'Bulanan',
//   'Bulanan',
//   'Bulanan',
//   'Mingguan',
//   'Harian',
//   'Mingguan',
//   'Harian',
//   'Bulanan',
//   'Bulanan',
//   'Bulanan',
//   'Bulanan',
// ];
// List<int> jumlahEvidence = [
//   1,
//   2,
//   3,
//   3,
//   3,
//   3,
//   3,
//   3,
//   3,
//   3,
//   3,
//   3,
//   3,
//   3,
//   3,
//   3,
//   3,
//   3,
// ];
}
