import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/StudentCourseTeacher/student_card.dart';
import 'package:flutter/material.dart';

class TeacherCourseParticipants extends StatefulWidget {
  const TeacherCourseParticipants({super.key});

  @override
  State<TeacherCourseParticipants> createState() => _TeacherCourseParticipantsState();
}

class _TeacherCourseParticipantsState extends State<TeacherCourseParticipants> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
        
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                StudentCard(
                  studentName: 'Amal Otifat',
                  attendancePercentage: .85,
                  Attendance: 10,
                  Absence: 5,
                ),
                StudentCard(
                  studentName: 'Shams Hamdan',
                  attendancePercentage: .48,
                  Attendance: 13,
                  Absence: 2,
                ),
                StudentCard(
                  studentName: 'Qosay Abu Alrob',
                  attendancePercentage: .75,
                  Attendance: 9,
                  Absence: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}