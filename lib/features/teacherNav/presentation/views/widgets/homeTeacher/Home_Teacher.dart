import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/RecntlyAccessedCoursesINTeacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/chartallstudentTea.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/home_teacher_header.dart';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeTeacher extends StatelessWidget {
  const HomeTeacher({Key? key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      // appBar: AppBar(
      //   backgroundColor: kPrimaryColor,
      //   elevation: 0,
      //   title: const Text(''),
      //   leading: Container(),
      //    flexibleSpace: Container(
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topRight,
      //         end: Alignment.bottomLeft,
      //         colors: [
      //           Color.fromRGBO(83, 157, 185, 1),
      //           Colors.grey,
      //         ],
      //       ),
      //     ),
      //   ), // To remove the back button
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
          HomeTeacherHeader(),
          RecntlyAddCourses(),
         // ListCourses(),
          TeacherHomeChart(),
      
        ],),
      )
    );
  }
}

























