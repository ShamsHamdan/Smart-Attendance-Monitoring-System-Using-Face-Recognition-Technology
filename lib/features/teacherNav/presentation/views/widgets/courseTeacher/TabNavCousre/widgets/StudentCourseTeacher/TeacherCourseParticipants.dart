import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/StudentCourseTeacher/student_card.dart';
import 'package:flutter/material.dart';

class TeacherCourseParticipants extends StatefulWidget {
  final String courseId;
  const TeacherCourseParticipants({super.key, required this.courseId});

  @override
  State<TeacherCourseParticipants> createState() =>
      _TeacherCourseParticipantsState();
}

class _TeacherCourseParticipantsState extends State<TeacherCourseParticipants> {
  List<QueryDocumentSnapshot> data = [];
  List<QueryDocumentSnapshot> dataOfStudent = [];
  int? numofstudent;
  String? name;
  String? url;
  bool isLoading = false;

  //List<QueryDocumentSnapshot> dataOfCourses = [];
  Future getData() async {
     setState(() {  isLoading = true;});
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    data.addAll(querySnapshot.docs);
    String docId = data[0].id;

    QuerySnapshot querySnapshotStu = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .doc(widget.courseId)
        .collection('students')
        .get();

    dataOfStudent.addAll(querySnapshotStu.docs);
    numofstudent = dataOfStudent.length;

    setState(() {
        isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          Expanded(
            child:
             isLoading
            ? Center(child: CircularProgressIndicator()) // Show loading indicator
            : ListView.builder(
              padding: EdgeInsets.all(16),
               shrinkWrap: true,
                itemCount: dataOfStudent.length,
                itemBuilder: (context, i) {
                  return InkWell(
            //         onTap: () {
            //             Navigator.push(
            // context,
            // MaterialPageRoute(builder: (context) => CourseInTeacherTabNav(courseId:dataOfCourses[i].id)),
          // );
          //           },
                    child: StudentCard(
                studentName: dataOfStudent[i]['name'],
                attendancePercentage: .85,
                Attendance: 10,
                Absence: 5,
                url: dataOfStudent[i]['url'],
              ),
                    );
                  
                }),
            ),
         ] ),
        
      
    );
  }
}
//  StudentCard(
//                 studentName: 'Amal Otifat',
//                 attendancePercentage: .85,
//                 Attendance: 10,
//                 Absence: 5,
//                 url: dataOfStudent[i]['url'],
//               ),