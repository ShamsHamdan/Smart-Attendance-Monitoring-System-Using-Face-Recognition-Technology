import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(TeacherHomeChart());
}

class TeacherHomeChart extends StatefulWidget {
  @override
  State<TeacherHomeChart> createState() => _TeacherHomeChartState();
}

class _TeacherHomeChartState extends State<TeacherHomeChart> {
  String? docId;
  String? courseId;
  int? numofattending;
  int? numofabsent;
  int? numofstudent;

  List<QueryDocumentSnapshot> dataOfatten = [];

  List<QueryDocumentSnapshot> dataOfCourses = [];

  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    DocumentSnapshot data1 = querySnapshot.docs[0];

    docId = data1.id;

    setState(() {});

    QuerySnapshot querySnapshott = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .get();

    dataOfCourses.addAll(querySnapshott.docs);
    courseId = dataOfCourses[0].id;
    setState(() {});
  }

  Future<void> getDataAtten() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Teachers')
          .doc(docId)
          .collection('courses')
          .doc(courseId)
          .collection('attendance')
          .get();

      dataOfatten.addAll(snapshot.docs);

      setState(() {
        print("$dataOfatten");
      });
    } catch (error) {
      print('Error getting attendance data: $error');
    }

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hello");
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (ModalRoute.of(context)?.isCurrent == true) {
        print("Fetching data for TeacherHomeChart");
        getData().then((_) => getDataAtten());
        print("$courseId");
      }
    });
  }

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
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          SizedBox(height: 27),
          Container(
              height: 330,
              child: BarChartSample2(
                dataOfatten: dataOfatten,
              )),
          SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}

// class BarChartSample2 extends StatelessWidget {
//   final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
//   final List<double> absentStudents = [8, 13, 10,20 , 15];
//   final List<double> attendingStudents = [72, 67, 70, 60, 65];

//   @override
//   Widget build(BuildContext context) {
//     return BarChart(
//       BarChartData(
//         backgroundColor: Colors.white,
//         gridData: FlGridData(show: false),
//         titlesData: FlTitlesData(
//           rightTitles: AxisTitles(
//             sideTitles: SideTitles(showTitles: false),
//           ),
//           topTitles: AxisTitles(
//             sideTitles: SideTitles(showTitles: false),
//           ),
//           bottomTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: bottomTitles,
//               reservedSize: 42,
//             ),
//           ),
//           leftTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               reservedSize: 28,
//               interval: 1,
//               getTitlesWidget: leftTitles,
//             ),
//           ),
//           //  leftTitles:AxisTitles(axisNameSize: 20),
//           show: true,
//         ),
//         borderData: FlBorderData(
//           show: true,
//           border: Border.all(
//             color: const Color(0xff37434d),
//             width: 1,
//           ),
//         ),
//         barGroups: _createBarGroups(),
//       ),
//     );
//   }

//   List<BarChartGroupData> _createBarGroups() {
//     List<BarChartGroupData> barGroups = [];

//     for (int i = 0; i < days.length; i++) {
//       barGroups.add(
//         BarChartGroupData(
//           x: i,
//           barsSpace: 4,
//           barRods: [
//             BarChartRodData(
//               toY: absentStudents[i],
//               color: Colors.red,
//               width: 16,
//             ),
//             BarChartRodData(
//               toY: attendingStudents[i],
//               color: Colors.green,
//               width: 16,
//             ),
//           ],
//         ),
//       );
//     }

//     return barGroups;
//   }
// }
class BarChartSample2 extends StatelessWidget {
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
  List<double> absentStudents = [];
  List<double> attendingStudents = [];

  BarChartSample2({required List<QueryDocumentSnapshot> dataOfatten}) {
    // Initialize the absentStudents and attendingStudents lists with zeros
    absentStudents = List.filled(days.length, 0);
    attendingStudents = List.filled(days.length, 0);

    // Find the latest date in the attendance records
    String latestDate = '';
    for (var data in dataOfatten) {
      String date = data['date'];
      if (date.compareTo(latestDate) > 0) {
        latestDate = date;
      }
    }

    // Populate the absentStudents and attendingStudents lists with attendance data for the latest date
    for (var data in dataOfatten) {
      String date = data['date'];
      String days = data['days'] ?? '0';
      int absent = data['absent'];
      int attending = data['attending'];

      // Find the index of the day in the days list
      int dayIndex = this.days.indexOf(
          days.split('-')[0]); // Assuming 'days' is in the format "Mon-Tue"

      // Update the absentStudents and attendingStudents lists at the corresponding index
      if (dayIndex >= 0 && date == latestDate) {
        absentStudents[dayIndex] = absent.toDouble();
        attendingStudents[dayIndex] = attending.toDouble();
      }
    }
  }

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
              // getTitlesWidget: (value) {
              //   // Convert double value to String and display on the y-axis
              //   return value.toInt().toString();
              // },
              // textStyle: const TextStyle(
              //   color: Color.fromARGB(255, 117, 132, 162),
              //   fontWeight: FontWeight.bold,
              //   fontSize: 14,
              // ),
            ),
          ),
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
  final titles = <String>['Mon', 'Tue', 'Wed', 'Tu', 'Su'];

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
    color: Color.fromARGB(255, 117, 132, 162),
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  if (value % 10 == 0 || value == 80) {
    text = value.toInt().toString();
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































// // import 'package:flutter/material.dart';
// // import 'package:fl_chart/fl_chart.dart';

// // class HomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.all(16.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.stretch,
// //         children: [
// //           Text(
// //             'Attendance Chart',
// //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
// //           ),
// //           SizedBox(height: 16),
// //           AspectRatio(
// //             aspectRatio: 1.70,
// //             child: LineChart(
// //               LineChartData(
// //                 gridData: FlGridData(show: false),
// //                 titlesData: FlTitlesData(show: false),
// //                 borderData: FlBorderData(
// //                   show: true,
// //                   border: Border.all(
// //                     color: const Color(0xff37434d),
// //                     width: 1,
// //                   ),
// //                 ),
// //                 minX: 0,
// //                 maxX: 11,
// //                 minY: 0,
// //                 maxY: 6,
// //                 lineBarsData: [
// //                   LineChartBarData(
// //                     spots: [
// //                       FlSpot(0, 3),
// //                       FlSpot(1, 1),
// //                       FlSpot(2, 4),
// //                       FlSpot(3, 2),
// //                       FlSpot(4, 5),
// //                       FlSpot(5, 1),
// //                       FlSpot(6, 4),
// //                       FlSpot(7, 2),
// //                       FlSpot(8, 3),
// //                       FlSpot(9, 4),
// //                       FlSpot(10, 2),
// //                       FlSpot(11, 5),
// //                     ],
// //                     isCurved: true,
// //                     colors: [Colors.green],
// //                     barWidth: 4,
// //                     belowBarData: BarAreaData(show: false),
// //                   ),
// //                   LineChartBarData(
// //                     spots: [
// //                       FlSpot(0, 1),
// //                       FlSpot(1, 3),
// //                       FlSpot(2, 2),
// //                       FlSpot(3, 4),
// //                       FlSpot(4, 1),
// //                       FlSpot(5, 3),
// //                       FlSpot(6, 2),
// //                       FlSpot(7, 5),
// //                       FlSpot(8, 1),
// //                       FlSpot(9, 2),
// //                       FlSpot(10, 4),
// //                       FlSpot(11, 1),
// //                     ],
// //                     isCurved: true,
// //                     colors: [Colors.red],
// //                     barWidth: 4,
// //                     belowBarData: BarAreaData(show: false),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // // void main() {
// // // //   runApp(MaterialApp(
// // // //     home: HomePage(),
// // // //   ));
// // // // }
