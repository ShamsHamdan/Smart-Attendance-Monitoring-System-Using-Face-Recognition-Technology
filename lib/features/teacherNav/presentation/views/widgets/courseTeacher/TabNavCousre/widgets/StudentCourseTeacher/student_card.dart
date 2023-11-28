import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class StudentCard extends StatelessWidget {
  final String studentName;
  final double attendancePercentage;
  final int Attendance;
  final int Absence;

  StudentCard({
    required this.studentName,
    required this.attendancePercentage,
    required this.Attendance,
    required this.Absence,
  });

  @override
  Widget build(BuildContext context) {
      bool isLowAttendance = attendancePercentage <= 0.5;
    return GestureDetector(
      onTap: () {
        _showAttendanceDialog(context, studentName, Attendance, Absence);
      },
      child: Card(
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
                    backgroundImage: AssetImage(AssetsData.profilepic),
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
              CircularPercentIndicator(
                radius: 24.0,
                lineWidth: 5.0,
                percent: attendancePercentage, // Change this to your actual percentage
                center:  Text(
                      "${(attendancePercentage * 100).toInt()}%",
                      style: TextStyle(
                        color: isLowAttendance ? Colors.red : Colors.green,
                      ),
                    ),// Change this to your actual text
                progressColor:isLowAttendance ? Colors.red : Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAttendanceDialog(
      BuildContext context, String studentName, int Attendance, int Absence) {
    int selectedOption = 0;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Attendance Status for $studentName'),
          content: FractionallySizedBox(
            widthFactor: 0.8,
            heightFactor: 0.4,
            child: Column(
              children: [
                _buildAttendanceOption(context, 'Attendance', 1, Attendance),
                _buildAttendanceOption(context, 'Absent', 2, Absence),
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        );
      },
    ).then((value) {
      if (value != null) {
        if (value == 1) {
          print('Selected Attendance for $studentName');
        } else if (value == 2) {
          print('Selected Absent for $studentName');
        }
      }
    });
  }

  Widget _buildAttendanceOption(
      BuildContext context, String option, int number, int initialValue) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, number);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(option),
            Row(
              children: [
                Text('$number'),
                SizedBox(width: 8),
                Text('($initialValue)'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
