import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:selaraskan_mobile/dashboard_upt/component/chart_air.dart';
import 'package:selaraskan_mobile/dashboard_upt/component/chart_listrik.dart';
import 'package:selaraskan_mobile/dashboard_upt/component/comp_sampah_laut.dart';
import 'package:selaraskan_mobile/program_modul/daftar_program.dart';
import 'package:semicircle_indicator/semicircle_indicator.dart';

import 'component/comp_sampah.dart';
import 'component/comp_sertifikat.dart';
import 'component/custom_appbar.dart';


class DashboardUPTPage extends StatefulWidget {
  const DashboardUPTPage({super.key});

  @override
  State<DashboardUPTPage> createState() => _DashboardUPTPageState();
}

class _DashboardUPTPageState extends State<DashboardUPTPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

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
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: LiquidPullToRefresh(
          springAnimationDurationInMilliseconds: 100,
          key: _refreshIndicatorKey,
          onRefresh: _handleRefresh,
          showChildOpacityTransition: false,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(color: Color(0xff1a5ee5)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child:
                    const SemicircularIndicator(
                      color: Color(0xff00f4ff),
                      bottomPadding: 0,
                      child: Text(
                        '75%',
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff00f4ff)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30,),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DaftarProgram()));
                          },
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(32),
                            margin: const EdgeInsets.only(bottom: 20),
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xff0269fd),
                                    Colors.purpleAccent,
                                    Colors.amber,
                                  ],
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(
                                    15))), // Adds a gradient background and rounded corners to the container
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Total Program Lingkungan',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 24
                                            // fontFamily:
                                            //     "monospace"
                                            )),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('25',
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white)),
                                        Icon(Icons.forest, color: Colors.white, size: 30,)
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Program Mandatory',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors
                                                .white)),
                                    Text('18',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors
                                                .white))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Program Voluntary',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors
                                                .white)),
                                    Text('7',
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors
                                                .white))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),

                        ///PENGGUNAAN LISTRIK BULANAN
                        const Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: Text('Penggunaan Listrik Bulanan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                            ),
                            SizedBox(height: 10,),
                            ChartListrik(),
                          ],
                        ),

                        ///PENGGUNAAN AIR BULANAN
                        const SizedBox(height: 15,),
                        const Column(
                          children: [
                            SizedBox(
                              height: 40,
                              child: Text('Penggunaan Air Bulanan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                            ),
                            SizedBox(height: 10,),
                            ChartAir()
                          ],
                        ),
                        const SizedBox(height: 15,),
                        const ComponentSampah(),
                        const SizedBox(height: 15,),
                        const ComponentSampahLaut(),
                        const SizedBox(height: 15,),
                        const ComponentSertifikat(),

                      ],
                    ),
                  ),
            
                  ///END Dashboard
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

