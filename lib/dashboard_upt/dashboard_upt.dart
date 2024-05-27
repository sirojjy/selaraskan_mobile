import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:selaraskan_mobile/dashboard_upt/component/chart_air.dart';
import 'package:selaraskan_mobile/dashboard_upt/component/chart_listrik.dart';
import 'package:selaraskan_mobile/dashboard_upt/component/comp_sampah_laut.dart';
import 'package:selaraskan_mobile/menu_program/daftar_program.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../menu/bottom_menu.dart';
import 'bloc/dashboard_bloc.dart';
import 'component/comp_sampah.dart';
import 'component/comp_sertifikat.dart';
import 'component/total_program.dart';

class DashboardUPTPage extends StatefulWidget {
  const DashboardUPTPage({super.key});

  @override
  State<DashboardUPTPage> createState() => _DashboardUPTPageState();
}

class _DashboardUPTPageState extends State<DashboardUPTPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
      GlobalKey<LiquidPullToRefreshState>();
  SharedPreferences? pref;


  @override
  void initState() {
    getPref();
    super.initState();
    BlocProvider.of<DashboardBloc>(context).add(const OnDashboardEvent());
  }

  void getPref() async {
    pref = await SharedPreferences.getInstance();
    setState(() {});
  }

  ///Pull to refresh start
  static int refreshNum = 10; // number that changes when refreshed
  Stream<int> counterStream =
      Stream<int>.periodic(const Duration(seconds: 3), (x) => refreshNum);
  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    setState(() {
      refreshNum = Random().nextInt(100);
    });
    return completer.future.then<void>((_) {
      ScaffoldMessenger.of(_scaffoldKey.currentState!.context).showSnackBar(
        SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
            label: 'RETRY',
            onPressed: () {
              _refreshIndicatorKey.currentState!.show();
            },
          ),
        ),
      );
    });
  }
  ///Pull to refresh end

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state){
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: const BottomMenu(),
            appBar: state.indexMenu == 0 ? null : AppBar(title: const Text('Daftar Program')),
            backgroundColor: state.indexMenu == 0 ? null : const Color(0xfffe6f2f9),
            body: LiquidPullToRefresh(
              springAnimationDurationInMilliseconds: 100,
              key: _refreshIndicatorKey,
              onRefresh: _handleRefresh,
              showChildOpacityTransition: false,
              child: SingleChildScrollView(
                child: state.indexMenu == 0 ? Container(
                  decoration: const BoxDecoration(color: Color(0xff1a5ee5)),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SemicircularIndicator(
                          color: const Color(0xff00f4ff),
                          bottomPadding: 0,
                          child: Text(
                            '${state.score?.toStringAsFixed(0)}',
                            style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff00f4ff)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color(0xffffffff),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            ///TOTAL PROGRAM LINGKUNGAN
                            TotalProgramLingkungan(
                              totalProgram: state.totalProgram,
                              programMandatory: state.jmlProgramMandatori,
                              programVoluntary: state.jmlProgramVoluntary,
                            ),

                            ///PENGGUNAAN LISTRIK BULANAN
                            Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                  child: Text(
                                    'Penggunaan Listrik Bulanan',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ChartListrik(
                                  jan: state.listrikJanuari != null ? double.parse(state.listrikJanuari! ) : 0,
                                  feb: state.listrikFebruari != null ? double.parse(state.listrikFebruari! ) : 0,
                                  mar: state.listrikMaret != null ? double.parse(state.listrikMaret! ) : 0,
                                  apr: state.listrikApril != null ? double.parse(state.listrikApril! ) : 0,
                                  mei: state.listrikMei != null ? double.parse(state.listrikMei! ) : 0,
                                  jun: state.listrikJuni != null ? double.parse(state.listrikJuni! ) : 0,
                                  jul: state.listrikJuli != null ? double.parse(state.listrikJuli! ) : 0,
                                  agu: state.listrikAgustus != null ? double.parse(state.listrikAgustus! ) : 0,
                                  sep: state.listrikSeptember != null ? double.parse(state.listrikSeptember! ) : 0,
                                  okt: state.listrikOktober != null ? double.parse(state.listrikOktober! ) : 0,
                                  nov: state.listrikNovember != null ? double.parse(state.listrikNovember! ) : 0,
                                  des: state.listrikDesember != null ? double.parse(state.listrikDesember! ) : 0,
                                ),
                              ],
                            ),

                            ///PENGGUNAAN AIR BULANAN
                            const SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                const SizedBox(
                                  height: 40,
                                  child: Text(
                                    'Penggunaan Air Bulanan',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ChartAir(
                                  jan: state.airJanuari != null ? double.parse(state.airJanuari! ) : 0,
                                  feb: state.airFebruari != null ? double.parse(state.airFebruari! ) : 0,
                                  mar: state.airMaret != null ? double.parse(state.airMaret! ) : 0,
                                  apr: state.airApril != null ? double.parse(state.airApril! ) : 0,
                                  mei: state.airMei != null ? double.parse(state.airMei! ) : 0,
                                  jun: state.airJuni != null ? double.parse(state.airJuni! ) : 0,
                                  jul: state.airJuli != null ? double.parse(state.airJuli! ) : 0,
                                  agu: state.airAgustus != null ? double.parse(state.airAgustus! ) : 0,
                                  sep: state.airSeptember != null ? double.parse(state.airSeptember! ) : 0,
                                  okt: state.airOktober != null ? double.parse(state.airOktober! ) : 0,
                                  nov: state.airNovember != null ? double.parse(state.airNovember! ) : 0,
                                  des: state.airDesember != null ? double.parse(state.airDesember! ) : 0,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ComponentSampah(
                              // sampahDarat: NumberFormat.decimalPattern().format(state.sampahDarat),
                              sampahDarat: '${state.sampahDarat} Kg',
                              sampahDaratOrganik: '${state.sampahDaratOrganik} Kg',
                              sampahDaratAnorganik: '${state.sampahDaratAnorganik} Kg',
                              sampahDaratDiolah: 'null Kg',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            ComponentSampahLaut(
                              sampahLaut: '${state.sampahLaut} Kg',
                              sampahLautOrganik: '${state.sampahLautOrganik} Kg',
                              sampahLautAnorganik: '${state.sampahLautAnorganik} Kg',
                              sampahLautDiolah: 'null Kg',
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const ComponentSertifikat(),
                          ],
                        ),
                      ),
                      ///END Dashboard
                    ],
                  ),
                )
                    : state.indexMenu == 1 ? const DaftarProgram()
                    : state.indexMenu == 2 ? const DaftarProgram()
                    : const DaftarProgram(),
              ),
            ),
          ),
        );
      },
    );
  }
}

