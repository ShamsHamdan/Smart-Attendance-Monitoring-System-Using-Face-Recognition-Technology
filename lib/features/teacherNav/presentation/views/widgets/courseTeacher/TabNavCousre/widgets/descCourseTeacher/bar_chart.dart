//  import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class ChartPage extends StatefulWidget {
//   const ChartPage({Key? key}) : super(key: key);

//   @override
//   State<ChartPage> createState() => _ChartPageState();
// }

// class _ChartPageState extends State<ChartPage> {
//   List<double> weeklySummary = [
//     4.40,
//     42.42,
//      2.50,
//     100.20,
//     10.50,
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: SizedBox(
//           height: 200,
//           child: MyBarGraph(
//             weeklySummary: weeklySummary,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class MyBarGraph extends StatelessWidget {
//   final List<double> weeklySummary;

//   const MyBarGraph({
//     Key? key,
//     required this.weeklySummary,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     BarData myBarData = BarData(
//       SunAmount: weeklySummary[0],
//       MonAmount: weeklySummary[1],
//       TueAmount: weeklySummary[2],
//       WedAmount: weeklySummary[3],
//       ThurAmount: weeklySummary[4],
//     );
//     myBarData.initializeBarData();
//     return BarChart(
//       BarChartData(
//         maxY: 100,
//         minY: 0,
//         gridData: FlGridData(show: false),
//         borderData: FlBorderData(show: false),
//         titlesData: FlTitlesData(
//           show: true,
//           topTitles: SideTitles(showTitles: false),
//           leftTitles: SideTitles(showTitles: false),
//           rightTitles: SideTitles(showTitles: false),
//           bottomTitles: SideTitles(
//             showTitles: true,
//             showTitles: (value) {
//               switch (value.toInt()) {
//                 case 0:
//                   return 'Sun';
//                 case 1:
//                   return 'Mon';
//                 case 2:
//                   return 'Tue';
//                 case 3:
//                   return 'Wed';
//                 case 4:
//                   return 'Thu';
//                 default:
//                   return '';
//               }
//             },
//           ),
//         ),
//         barGroups: myBarData.barData
//             .map(
//               (data) => BarChartGroupData(
//                 x: data.x,
//                 barRods: [
//                   BarChartRodData(
//                     toY: data.y,
//                     width: 25,
//                     color: Color(0xff369893),
//                   ),
//                 ],
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }

// class BarData {
//   final double SunAmount;
//   final double MonAmount;
//   final double TueAmount;
//   final double WedAmount;
//   final double ThurAmount;

//   BarData({
//     required this.SunAmount,
//     required this.MonAmount,
//     required this.TueAmount,
//     required this.WedAmount,
//     required this.ThurAmount,
//   });

//   List<IndividualBar> barData = [];

//   void initializeBarData() {
//     barData = [
//       IndividualBar(x: 0, y: SunAmount),
//       IndividualBar(x: 1, y: MonAmount),
//       IndividualBar(x: 2, y: TueAmount),
//       IndividualBar(x: 3, y: WedAmount),
//       IndividualBar(x: 4, y: ThurAmount),
//     ];
//   }
// }

// class IndividualBar {
//   final int x;
//   final double y;

//   IndividualBar({
//     required this.x,
//     required this.y,
//   });
// }