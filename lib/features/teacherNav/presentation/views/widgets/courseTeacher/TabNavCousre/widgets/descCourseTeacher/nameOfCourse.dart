import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/studentNumber.dart';
import 'package:flutter/material.dart';

class NameOfCourse extends StatefulWidget {
  final String courseId;
  const NameOfCourse({super.key, required this.courseId});

  @override
  State<NameOfCourse> createState() => _NameOfCourseState();
}

class _NameOfCourseState extends State<NameOfCourse> {
  List<QueryDocumentSnapshot> data = [];
  List<QueryDocumentSnapshot> dataOfStudent = [];
  int? numofstudent;
  String? name;
  String? id;
  String? sec;
  //List<QueryDocumentSnapshot> dataOfCourses = [];
  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    data.addAll(querySnapshot.docs);
    String docId = data[0].id;

    DocumentSnapshot querySnapshott = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .doc(widget.courseId)
        .get();

    DocumentSnapshot dataofcourse = querySnapshott;
    sec = dataofcourse["section"];
    id = dataofcourse["idCourse"];
    name = dataofcourse["name"];

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
      // print("${data[0]['name']}");
      // Adminemail = data['email'];
      // Adminpass = data['password'];
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Section$sec",
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
                //margin: EdgeInsets.only(bottom: -8.0),
              ),
            ),
            Text(
              name ?? '',
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              id ?? '',
              style: TextStyle(
                fontSize: 17,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        StudentNumber(
          number: numofstudent ?? 0,
        ),
      ],
    );
  }
}
