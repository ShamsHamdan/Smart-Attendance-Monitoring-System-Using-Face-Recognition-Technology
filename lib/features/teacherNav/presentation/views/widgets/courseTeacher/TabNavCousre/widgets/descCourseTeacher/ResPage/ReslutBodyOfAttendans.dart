import 'package:first_version/constants.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/List_Name_Res.dart';
//import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/List_Names_Res.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/Res_Body_Header.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/filterButon.dart';
import 'package:flutter/material.dart';

class ReslutOfAttendans extends StatefulWidget {
  const ReslutOfAttendans({super.key});

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
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
      body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
             
              //padding: const EdgeInsets.all(8.0),
               
                    children: [
              ResBodyHeader(),
              FilterButton(),
              SizedBox(height: 30,),
              ListOfNameForRes(),
                    ],
                  ),
          ),
          ),
    );
  }
}
