import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartListrik extends StatelessWidget {
  const ChartListrik({super.key});

  @override
  Widget build(BuildContext context) {
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


List<BarChartGroupData> barChartSampleData = [
  BarChartGroupData(
    x: 0,
    barRods: [BarChartRodData(toY: 8000, gradient: _barsGradient, )],
    showingTooltipIndicators: [],
  ),
  BarChartGroupData(
    x: 1,
    barRods: [BarChartRodData(toY: 10000, gradient: _barsGradient, color: Colors.white)],
    showingTooltipIndicators: [],
  ),
  BarChartGroupData(
    x: 2,
    barRods: [BarChartRodData(toY: 14000, gradient: _barsGradient,)],
    showingTooltipIndicators: [],
  ),
  BarChartGroupData(
    x: 3,
    barRods: [BarChartRodData(toY: 15000, gradient: _barsGradient,)],
    showingTooltipIndicators: [],
  ),
  BarChartGroupData(
    x: 4,
    barRods: [BarChartRodData(toY: 13000, gradient: _barsGradient,)],
    showingTooltipIndicators: [],
  ),
  BarChartGroupData(
    x: 5,
    barRods: [BarChartRodData(toY: 10000, gradient: _barsGradient,)],
    showingTooltipIndicators: [],
  ),
  BarChartGroupData(
    x: 6,
    barRods: [BarChartRodData(toY: 16000, gradient: _barsGradient,)],
    showingTooltipIndicators: [],
  ),
  BarChartGroupData(
    x: 7,
    barRods: [BarChartRodData(toY: 16000, gradient: _barsGradient,)],
    showingTooltipIndicators: [],
  ),
  BarChartGroupData(
    x: 8,
    barRods: [BarChartRodData(toY: 16000, gradient: _barsGradient,)],
    showingTooltipIndicators: [],
  ),
  BarChartGroupData(
    x: 9,
    barRods: [BarChartRodData(toY: 16000, gradient: _barsGradient,)],
    showingTooltipIndicators: [],
  ),
  BarChartGroupData(
    x: 10,
    barRods: [BarChartRodData(toY: 16000, gradient: _barsGradient,)],
    showingTooltipIndicators: [],
  ),
  BarChartGroupData(
    x: 11,
    barRods: [BarChartRodData(toY: 16000, gradient: _barsGradient,)],
    showingTooltipIndicators: [],
  ),
];

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
      reservedSize: 40,
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