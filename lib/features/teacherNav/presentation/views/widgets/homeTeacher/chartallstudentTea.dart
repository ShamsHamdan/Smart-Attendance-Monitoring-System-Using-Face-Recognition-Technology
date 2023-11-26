import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TeacherHomeChart());
}

class TeacherHomeChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 18,
          ),
          Text(
            'Weekly Attendance',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.black),
          ),
          SizedBox(height: 27),
          Container(height: 330, child: BarChartSample2()),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

class BarChartSample2 extends StatelessWidget {
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
  final List<double> absentStudents = [8, 13, 10,20 , 15];
  final List<double> attendingStudents = [72, 67, 70, 60, 65];

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        backgroundColor: Colors.white,
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: bottomTitles,
              reservedSize: 42,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 28,
              interval: 1,
              getTitlesWidget: leftTitles,
            ),
          ),
          //  leftTitles:AxisTitles(axisNameSize: 20),
          show: true,
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: const Color(0xff37434d),
            width: 1,
          ),
        ),
        barGroups: _createBarGroups(),
      ),
    );
  }

  List<BarChartGroupData> _createBarGroups() {
    List<BarChartGroupData> barGroups = [];

    for (int i = 0; i < days.length; i++) {
      barGroups.add(
        BarChartGroupData(
          x: i,
          barsSpace: 4,
          barRods: [
            BarChartRodData(
              toY: absentStudents[i],
              color: Colors.red,
              width: 16,
            ),
            BarChartRodData(
              toY: attendingStudents[i],
              color: Colors.green,
              width: 16,
            ),
          ],
        ),
      );
    }

    return barGroups;
  }
}

Widget bottomTitles(double value, TitleMeta meta) {
  final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Su'];

  final Widget text = Text(
    titles[value.toInt()],
    style: const TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16, //margin top
    child: text,
  );
}

Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text ;
  if (value % 10 == 0 ||  value==80) {
          text=value.toInt().toString();
              }
              
  // if (value == 8) {
  //   text = '8';
  // } else if (value == 72) {
  //   text = '72';
  // } else if (value ==13 ) {
  //   text = '13';
  // }
  // else if (value ==67 ) {
  //   text = '67';
  // }
  // else if (value == 10) {
  //   text = '10';
  // }
  // else if (value == 20) {
  //   text = '20';
  // }else if (value ==60 ) {
  //   text = '60';
  // }else if (value ==15) {
  //   text = '15';
  // }else if (value ==65 ) {
  //   text = '65';
  // }
   else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}


// import 'package:flutter/material.dart';
// import 'package:fl_chart/fl_chart.dart';

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Text(
//             'Attendance Chart',
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//           ),
//           SizedBox(height: 16),
//           AspectRatio(
//             aspectRatio: 1.70,
//             child: LineChart(
//               LineChartData(
//                 gridData: FlGridData(show: false),
//                 titlesData: FlTitlesData(show: false),
//                 borderData: FlBorderData(
//                   show: true,
//                   border: Border.all(
//                     color: const Color(0xff37434d),
//                     width: 1,
//                   ),
//                 ),
//                 minX: 0,
//                 maxX: 11,
//                 minY: 0,
//                 maxY: 6,
//                 lineBarsData: [
//                   LineChartBarData(
//                     spots: [
//                       FlSpot(0, 3),
//                       FlSpot(1, 1),
//                       FlSpot(2, 4),
//                       FlSpot(3, 2),
//                       FlSpot(4, 5),
//                       FlSpot(5, 1),
//                       FlSpot(6, 4),
//                       FlSpot(7, 2),
//                       FlSpot(8, 3),
//                       FlSpot(9, 4),
//                       FlSpot(10, 2),
//                       FlSpot(11, 5),
//                     ],
//                     isCurved: true,
//                     colors: [Colors.green],
//                     barWidth: 4,
//                     belowBarData: BarAreaData(show: false),
//                   ),
//                   LineChartBarData(
//                     spots: [
//                       FlSpot(0, 1),
//                       FlSpot(1, 3),
//                       FlSpot(2, 2),
//                       FlSpot(3, 4),
//                       FlSpot(4, 1),
//                       FlSpot(5, 3),
//                       FlSpot(6, 2),
//                       FlSpot(7, 5),
//                       FlSpot(8, 1),
//                       FlSpot(9, 2),
//                       FlSpot(10, 4),
//                       FlSpot(11, 1),
//                     ],
//                     isCurved: true,
//                     colors: [Colors.red],
//                     barWidth: 4,
//                     belowBarData: BarAreaData(show: false),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // // void main() {
// // //   runApp(MaterialApp(
// // //     home: HomePage(),
// // //   ));
// // // }
