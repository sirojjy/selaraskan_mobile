import 'package:flutter/material.dart';
import 'package:selaraskan_mobile/program_modul/form_daftar_program.dart';

class DaftarProgram extends StatefulWidget {
  const DaftarProgram({super.key});

  @override
  State<DaftarProgram> createState() => _DaftarProgramState();
}

class _DaftarProgramState extends State<DaftarProgram> {
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

  // Assuming all lists have the same length
  List<String> icons = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
  ];
  List<String> namaProgram = [
    'Kebersihan Pelabuhan',
    'Pengukuran Volumen Sampah Darat',
    'Pengukuran Volumen Sampah Laut',
    'Pemilahan Sampah',
    'Pengelolaan Sampah',
    'Pengukuran Kualitas Udara',
    'RTH',
    'Pengukuran Kualitas Air Kolam',
    'Pengukuran Air Limbah',
    'Penggunaan Lampu Hemat Energi',
    'Himbauan Hemat Energi',
    'Patroli Energi',
    'Himbauan Hemat Air',
    'Patroli Air',
    'Drone',
    'Penampungan Limbah B3',
    'Kepatuhan Tenan',
    'Pelaksanaan Sertifikasi & Surveillance',
  ];
  List<String> jenisProgram = [
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
    'Mandatory',
  ];
  List<String> jadwal = [
    'Harian',
    'Harian',
    'Harian',
    'Harian',
    'Mingguan',
    'Bulanan',
    'Mingguan',
    'Bulanan',
    'Bulanan',
    'Bulanan',
    'Mingguan',
    'Harian',
    'Mingguan',
    'Harian',
    'Bulanan',
    'Bulanan',
    'Bulanan',
    'Bulanan',
  ];
  List<int> jumlahEvidence = [
    1,
    2,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
    3,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Daftar Program')),
        backgroundColor: Color(0xfffE6F2F9),
        body: ListView.builder(
          itemCount: icons.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10, right: 10),
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FormDaftarProgram()));
                  },
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 3, bottom: 3),
                        child: Row(
                          children: [
                            SizedBox(
                              child: Icon(iconMap[icons[index]]),
                            ),
                            SizedBox(width: 5,),
                            Text(
                              namaProgram[index],
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Color(0xfff3478DF),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Program',
                                  style: TextStyle(color: Colors.white),
                                ),

                                Text(
                                  jenisProgram[index],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Jadwal',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  jadwal[index],
                                  style: TextStyle(color: Colors.white),
                                ), // Convert DateTime to string
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Evidence',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  jumlahEvidence[index].toString(),
                                  style: TextStyle(color: Colors.white),
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
        ),
      ),
    );
  }
}
