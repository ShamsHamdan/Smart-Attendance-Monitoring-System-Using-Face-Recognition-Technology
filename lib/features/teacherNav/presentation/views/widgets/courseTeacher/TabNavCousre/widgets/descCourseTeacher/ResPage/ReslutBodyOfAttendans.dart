import 'package:first_version/constants.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/CourseInTeacherTabNav.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/List_Name_Res.dart';
//import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/List_Names_Res.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/Res_Body_Header.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/filterButon.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/test.dart';
import 'package:flutter/material.dart';

class ReslutOfAttendans extends StatefulWidget {
  final String courseId;
  const ReslutOfAttendans({super.key, required this.courseId});

  @override
  State<ReslutOfAttendans> createState() => _ReslutOfAttendansState();
}

class _ReslutOfAttendansState extends State<ReslutOfAttendans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: const Text(''), // Empty title
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CourseInTeacherTabNav(courseId: widget.courseId,)),
          );
          },
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            //padding: const EdgeInsets.all(8.0),

            children: [
              //  ResBodyHeader(),
              //  Expanded(child:Text('sham') ),

              Expanded(child: StudentAttendancePage(courseId: widget.courseId)),
              //  FilterButton(),
              // SizedBox(height: 30,),
              //  ListOfNameForRes(),
            ],
          ),
        ),
      ),
    );
  }
}
