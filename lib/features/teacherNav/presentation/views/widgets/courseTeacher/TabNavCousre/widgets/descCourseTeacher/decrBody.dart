import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/AttendanceResSecHome.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/DetailsCourse.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/TakeAttendanceBtn.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/bar_chart_deleted.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/nameOfCourse.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/studentNumber.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/studentStatistics.dart';
import 'package:flutter/material.dart';

class CourseInfo extends StatefulWidget {
  final String courseId;
 // final String teacherId;
  const CourseInfo({
    Key? key,
    required this.courseId, 
  }) : super(key: key);

  @override
  State<CourseInfo> createState() => _CourseInfoState();
}

class _CourseInfoState extends State<CourseInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
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
              NameOfCourse(
                courseId: widget.courseId,
              ),
              SizedBox(
                height: 20,
              ),
              CourseDetails(
                courseId: widget.courseId,
              ),
              SizedBox(
                height: 40,
              ),
              TakeAttendanceBtn(),
              SizedBox(
                height: 60,
              ),
              ResAtt(
                courseId: widget.courseId,
              ),
              SizedBox(
                height: 0,
              ),
              studentStatistics(key: UniqueKey(),courseId: widget.courseId,),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
