import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/RecntlyAccessedCoursesINTeacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/chartallstudentTea.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/home_teacher_header.dart';

import 'package:flutter/material.dart';

class HomeTeacher extends StatefulWidget {
  HomeTeacher({Key? key});

  @override
  State<HomeTeacher> createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {
  final PageController _pageController = PageController();

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(238, 238, 238, 1),
        body: PageView(controller: PageController(), children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 300, child: HomeTeacherHeader()),
                RecntlyAccessedCourses(),
                // ListCourses(),
                TeacherHomeChart(),
              ],
            ),
          ),
        ]));
  }
}
