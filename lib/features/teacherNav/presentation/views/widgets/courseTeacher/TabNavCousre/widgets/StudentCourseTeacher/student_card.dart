import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StudentCard extends StatelessWidget {
  final String studentName;
  final double attendancePercentage;
  final int Attendance;
  final int Absence;
  final String url;

  StudentCard({
    required this.studentName,
    required this.attendancePercentage,
    required this.Attendance,
    required this.Absence,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    bool isLowAttendance = attendancePercentage <= 0.5;
    return GestureDetector(
      onTap: () {
        // _showAttendanceDialog(context);
      },
      child: Card(
        color: Color.fromRGBO(255, 255, 255, 1),
        elevation: 5,
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: url != null && url!.isNotEmpty
                        ? NetworkImage(Uri.parse(url!).toString())
                        : AssetImage(AssetsData.profilepic)
                            as ImageProvider<Object>,

                    // Replace with actual image path
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    studentName,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // CircularPercentIndicator(
              //   radius: 24.0,
              //   lineWidth: 5.0,
              //   percent:
              //       attendancePercentage, // Change this to your actual percentage
              //   center: Text(
              //     "${(attendancePercentage * 100).toInt()}%",
              //     style: TextStyle(
              //       color: isLowAttendance ? Colors.red : Colors.green,
              //     ),
              //   ), // Change this to your actual text
              //   progressColor: isLowAttendance ? Colors.red : Colors.green,
              // ),
            ],
          ),
        ),
      ),
    );
  }

//   void _showAttendanceDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Attendance Details:',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//               ),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Attendance: 11',
//                       style: TextStyle(color: Colors.green, fontSize: 20)),
//                 ],
//               ),
//               SizedBox(height: 8),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Absence: ',
//                       style: TextStyle(color: Colors.red, fontSize: 20)),
//                   Text('4', style: TextStyle(color: Colors.red, fontSize: 20)),
//                 ],
//               ),
//               SizedBox(height: 8),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: kPrimaryColor,
//                   onPrimary: Colors.white,
//                 ),
//                 child: Text(
//                   'OK',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             ],
//           ),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildAttendanceOption(
//       BuildContext context, String option, int number, int initialValue) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.pop(context, number);
//       },
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 8),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(option),
//             Row(
//               children: [
//                 Text('$number'),
//                 SizedBox(width: 8),
//                 Text('($initialValue)'),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
}
