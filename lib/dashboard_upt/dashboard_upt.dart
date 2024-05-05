import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gauge_chart/gauge_chart.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:selaraskan_mobile/dashboard_upt/res/custom_appbar.dart';
import 'package:selaraskan_mobile/program_modul/daftar_program.dart';

class DashboardUPTPage extends StatefulWidget {
  const DashboardUPTPage({super.key});

  @override
  State<DashboardUPTPage> createState() => _DashboardUPTPageState();
}

class _DashboardUPTPageState extends State<DashboardUPTPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<LiquidPullToRefreshState> _refreshIndicatorKey =
  GlobalKey<LiquidPullToRefreshState>();

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: LiquidPullToRefresh(
          key: _refreshIndicatorKey,
          onRefresh: _handleRefresh,
          showChildOpacityTransition: false,
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(color: Color(0xff3478df)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: GaugeChart(
                      children: [
                        PieData(
                          value: 10,
                          color: const Color(0xff8cf33b),
                          description: "Total Score",
                        ),
                        PieData(
                          value: 4,
                          color: Colors.grey.shade300,
                          description: "Planned",
                        ),
                        // PieData(
                        //   value: 14,
                        //   color: Colors.grey.shade300,
                        //   description: "To plan",
                        // ),
                      ],
                      // gap: 1.8,
                      animateDuration: const Duration(seconds: 1),
                      start: 180,
                      displayIndex: 0,
                      shouldAnimate: true,
                      animateFromEnd: false,
                      isHalfChart: true,
                      size: 300,
                      showValue: false,
                      borderWidth: 25,
                    ),
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
                            decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF846AFF),
                                    Color(0xFF755EE8),
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
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Image.asset(
                            'assets/foto/listrik_chart.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: Image.asset(
                            'assets/foto/air_dll.png',
                            fit: BoxFit.cover,
                          ),
                        ),
            
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
