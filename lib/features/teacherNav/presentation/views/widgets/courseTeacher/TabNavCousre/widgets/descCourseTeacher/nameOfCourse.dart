import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/studentNumber.dart';
import 'package:flutter/material.dart';

class NameOfCourse extends StatefulWidget {
  const NameOfCourse({super.key});

  @override
  State<NameOfCourse> createState() => _NameOfCourseState();
}

class _NameOfCourseState extends State<NameOfCourse> {
  @override
  Widget build(BuildContext context) {
    return   Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: [
                    Text("Section1", style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                          //margin: EdgeInsets.only(bottom: -8.0), 
                      ),
                        
                      ),
                    Text("Internship",style: TextStyle(
                        fontSize: 27,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),),
                    SizedBox(height: 2,),
                    Text(
                      '230214990',
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                StudentNumber(
                  number: 15,
                ),
              ],
            );
  }
}