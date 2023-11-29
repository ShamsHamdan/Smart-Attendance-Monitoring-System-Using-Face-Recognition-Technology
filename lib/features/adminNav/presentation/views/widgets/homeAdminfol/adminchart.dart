import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AdminChart extends StatelessWidget {
  int _lastIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Monthly Attendance',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 22),
          AspectRatio(
            aspectRatio: 1.70,
            child: LineChart(
              LineChartData(
                backgroundColor: Colors.white,
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  show: true,
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
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(
                    color: const Color(0xff37434d),
                    width: 1,
                  ),
                ),
                minX: 0,
                maxX: 4,
                minY: 0,
                maxY: 6,
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 3),
                      FlSpot(1, 1),
                      FlSpot(2, 4),
                      FlSpot(3, 2),
                      FlSpot(4, 5),
                      // FlSpot(5, 1),
                      // FlSpot(6, 4),
                      // FlSpot(7, 2),
                      // FlSpot(8, 3),
                      // FlSpot(9, 4),
                      // FlSpot(10, 2),
                      ////FlSpot(11, 5),
                    ],
                    isCurved: true,
                    color: Colors.green,
                    barWidth: 4,
                    belowBarData: BarAreaData(show: false),
                  ),
                  LineChartBarData(
                    spots: [
                      FlSpot(0, 1),
                      FlSpot(1, 3),
                      FlSpot(2, 2),
                      FlSpot(3, 4),
                      FlSpot(4, 1),
                      // FlSpot(5, 3),
                      // FlSpot(6, 2),
                      // FlSpot(7, 5),
                      // FlSpot(8, 1),
                      // FlSpot(9, 2),
                      // FlSpot(10, 4),
                      //FlSpot(11, 1),
                    ],
                    isCurved: true,
                    color: Colors.red,
                    barWidth: 4,
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget leftTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Color(0xff7589a2),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  if (value == 1) {
    text = '.5K';
  }else if (value == 2) {
    text = '.8K';
  }
  else if (value == 3) {
    text = '1K';
  }
   else if (value == 4) {
    text = '2K';
  } else if (value == 5) {
    text = '3K';
  } else {
    return Container();
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 0,
    child: Text(text, style: style),
  );
}

Widget bottomTitles(double value, TitleMeta meta) {
  
  final titles = ['Oct', 'Nov', 'Dec', 'Jan', 'Feb'];
 int _lastIndex=-1;
  // Ensure that the value is an integer and within the valid range
  final int index = value.round().toInt().clamp(0, titles.length - 1);

  // Check if the current index is the same as the last one
 
  
  if (index == _lastIndex) {
    return Container(); // Return an empty container to avoid repetition
  }

  _lastIndex = index; // Update the last index

  final Widget text = Text(
    titles[index],
    style: const TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    ),
  );

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 16, // margin top
    child: text,
  );
}


// Widget bottomTitles(double value, TitleMeta meta) {
//   print('Bottom Title Value: $value');
//   final titles = <String>['Oct', 'Nov', 'Dec', 'Jan', 'Feb'];
//   if (value >= 0 && value < titles.length) {
//     final Widget text = Text(
//       titles[value.toInt()],
//       style: const TextStyle(
//         color: Color(0xff7589a2),
//         fontWeight: FontWeight.bold,
//         fontSize: 14,
//       ),
//     );

//     return SideTitleWidget(
//       axisSide: meta.axisSide,
//       space: 16, // margin top
//       child: text,
//     );
//   } else {
//     return Container(); // Return an empty container if value is out of bounds
//   }
// }

  // Widget bottomTitles(double value, TitleMeta meta) {
  //    print('Bottom Title Value: $value');
  //   final titles = <String>['Oct', 'Nov', 'Dec', 'Jan', 'Feb','week2'];

  //   final Widget text = Text(
  //     titles[value.toInt()],
  //     style: const TextStyle(
  //       color: Color(0xff7589a2),
  //       fontWeight: FontWeight.bold,
  //       fontSize: 14,
  //     ),
  //   );

  //   return SideTitleWidget(
  //     axisSide: meta.axisSide,
  //     space: 16, //margin top
  //     child: text,
  //   );
  // }


// // void main() {
// //   runApp(MaterialApp(
// //     home: HomePage(),
// //   ));
// // }
