import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'chart_air.dart';

class ChartListrik extends StatefulWidget {
  const ChartListrik({
    super.key,
    required this.jan,
    required this.feb,
    required this.mar,
    required this.apr,
    required this.mei,
    required this.jun,
    required this.jul,
    required this.agu,
    required this.sep,
    required this.okt,
    required this.nov,
    required this.des,
  });
  final double jan;
  final double feb;
  final double mar;
  final double apr;
  final double mei;
  final double jun;
  final double jul;
  final double agu;
  final double sep;
  final double okt;
  final double nov;
  final double des;

  @override
  State<ChartListrik> createState() => _ChartListrikState();
}

class _ChartListrikState extends State<ChartListrik> {
  @override
  Widget build(BuildContext context) {

    List<BarChartGroupData> barChartSampleData = [
      BarChartGroupData(
        x: 0,
        barRods: [
          BarChartRodData(
            toY: widget.jan,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [],
      ),
      BarChartGroupData(
        x: 1,
        barRods: [
          BarChartRodData(toY: widget.feb, gradient: _barsGradient, color: Colors.white)
        ],
        showingTooltipIndicators: [],
      ),
      BarChartGroupData(
        x: 2,
        barRods: [
          BarChartRodData(
            toY: widget.mar,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [],
      ),
      BarChartGroupData(
        x: 3,
        barRods: [
          BarChartRodData(
            toY: widget.apr,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [],
      ),
      BarChartGroupData(
        x: 4,
        barRods: [
          BarChartRodData(
            toY: widget.mei,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [],
      ),
      BarChartGroupData(
        x: 5,
        barRods: [
          BarChartRodData(
            toY: widget.jun,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [],
      ),
      BarChartGroupData(
        x: 6,
        barRods: [
          BarChartRodData(
            toY: widget.jul,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [],
      ),
      BarChartGroupData(
        x: 7,
        barRods: [
          BarChartRodData(
            toY: widget.agu,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [],
      ),
      BarChartGroupData(
        x: 8,
        barRods: [
          BarChartRodData(
            toY: widget.sep,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [],
      ),
      BarChartGroupData(
        x: 9,
        barRods: [
          BarChartRodData(
            toY: widget.okt,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [],
      ),
      BarChartGroupData(
        x: 10,
        barRods: [
          BarChartRodData(
            toY: widget.nov,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [],
      ),
      BarChartGroupData(
        x: 11,
        barRods: [
          BarChartRodData(
            toY: widget.des,
            gradient: _barsGradient,
          )
        ],
        showingTooltipIndicators: [],
      ),
    ];

    return Container(
      height: 200,
      child: BarChart(
        BarChartData(
          titlesData: titlesData,
          barGroups: barChartSampleData,
          gridData: const FlGridData(show: true),
          alignment: BarChartAlignment.spaceAround,
          borderData: borderData,
        ),
      ),
    );


  }
}

FlBorderData get borderData => FlBorderData(
      show: false,
    );

LinearGradient get _barsGradient => const LinearGradient(
      colors: [
        Color(0xfffb0060),
        Color(0xfffb9800),
      ],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    );

FlTitlesData get titlesData => const FlTitlesData(
      show: true,
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: getTitles,
        ),
      ),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 50,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
    );

Widget getTitles(double value, TitleMeta meta) {
  final style = TextStyle(
    color: Colors.blue.shade900,
    fontWeight: FontWeight.bold,
    fontSize: 12,
  );
  String text;
  switch (value.toInt()) {
    case 0:
      text = 'Jan';
      break;
    case 1:
      text = 'Feb';
      break;
    case 2:
      text = 'Mar';
      break;
    case 3:
      text = 'Apr';
      break;
    case 4:
      text = 'Mei';
      break;
    case 5:
      text = 'Jun';
      break;
    case 6:
      text = 'Jul';
      break;
    case 7:
      text = 'Agu';
      break;
    case 8:
      text = 'Sep';
      break;
    case 9:
      text = 'Okt';
      break;
    case 10:
      text = 'Nov';
      break;
    case 11:
      text = 'Des';
      break;
    default:
      text = '';
      break;
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 4,
    child: Text(text, style: style),
  );
}
