import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/listmaincourses.dart';

import 'package:flutter/material.dart';

class CourseTeacher extends StatelessWidget {
  
const CourseTeacher({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(238, 238, 238, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
            ListCoursestest(),
            
              
          ],),
        ),
      )
    );
  }
}