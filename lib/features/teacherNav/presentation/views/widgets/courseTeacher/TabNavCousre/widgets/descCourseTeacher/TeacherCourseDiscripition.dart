import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/image_header.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/decrBody.dart';
import 'package:flutter/material.dart';

//import 'bar_chart.dart';

class TeacherCourseDiscripition extends StatefulWidget {
  final String courseId;
  const TeacherCourseDiscripition({super.key, required this.courseId});

  @override
  State<TeacherCourseDiscripition> createState() =>
      _TeacherCourseDiscripitionState();
}

class _TeacherCourseDiscripitionState extends State<TeacherCourseDiscripition> {
  List<QueryDocumentSnapshot> data = [];
  String? url;
  String? docId;
  //List<QueryDocumentSnapshot> dataOfCourses = [];
  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    data.addAll(querySnapshot.docs);
     docId = data[0].id;

    DocumentSnapshot querySnapshott = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .doc(widget.courseId)
        .get();

    DocumentSnapshot dataofcourse = querySnapshott;
    url = dataofcourse["url"];

    setState(() {
      print("$docId");
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
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Container(
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    //  height: 300,
                    child: ImageHeader(imgSrc: url ?? ''),
                  )),
              Positioned(
                  top: 190,
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: CourseInfo(
                      courseId: widget.courseId,
                     
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    