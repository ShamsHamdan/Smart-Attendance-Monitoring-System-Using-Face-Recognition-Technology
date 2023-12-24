import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/AttendanceResSecHome.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/DetailsCourse.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/TakeAttendanceBtn.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/bar_chart.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/nameOfCourse.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/studentNumber.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/studentStatistics.dart';
import 'package:flutter/material.dart';

class CourseInfo extends StatelessWidget {
  const CourseInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(20,20,20,0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align at the start
            crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisSize: MainAxisSize.min,
        
            children: [
              NameOfCourse(),
              SizedBox(height: 20,),
              CourseDetails(),
              SizedBox(height: 40,),
              TakeAttendanceBtn(),
              SizedBox(height: 60,),
              ResAtt(),
              SizedBox(height: 0,),
              studentStatistics(),
               SizedBox(height: 20,)
        
        
        
        
              
            ],
          ),
        ),
      ),
    );
  }
}
