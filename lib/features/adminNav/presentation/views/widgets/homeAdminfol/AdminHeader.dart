import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/picAdminHome.dart';
import 'package:flutter/material.dart';

class HomeAdminHeader extends StatefulWidget {
  const HomeAdminHeader({super.key});

  @override
  State<HomeAdminHeader> createState() => _HomeAdminHeaderState();
}

class _HomeAdminHeaderState extends State<HomeAdminHeader> {
  DocumentSnapshot? data2;
  String? name;
  int? numberOfTeachers;
  List<QueryDocumentSnapshot> dataNumberTeacher = [];

  int? numberOfCourses;
  List<QueryDocumentSnapshot> dataNumberCourses = [];

  int? numberOfStudents;
  List<QueryDocumentSnapshot> dataNumberStudents = [];

  Future getDataTeacher() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("Admin", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    dataNumberTeacher.addAll(querySnapshot.docs);
    numberOfTeachers = dataNumberTeacher.length;
    // Map<String, dynamic>? data = data1.data() as Map<String, dynamic>?;
    setState(() {
      // print("${data[0]['name']}");
      // Adminemail = data['email'];
      // Adminpass = data['password'];
    });
  }

  Future getDataStudent() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Students')
        .where("Admin", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    dataNumberStudents.addAll(querySnapshot.docs);
    numberOfStudents = dataNumberStudents.length;
    // Map<String, dynamic>? data = data1.data() as Map<String, dynamic>?;
    setState(() {
      // print("${data[0]['name']}");
      // Adminemail = data['email'];
      // Adminpass = data['password'];
    });
  }

  Future getDataCourses() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Courses')
        .where("Admin", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    dataNumberCourses.addAll(querySnapshot.docs);
    numberOfCourses = dataNumberCourses.length;
    // Map<String, dynamic>? data = data1.data() as Map<String, dynamic>?;
    setState(() {});
  }

  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Admins')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (querySnapshot.size > 0) {
      DocumentSnapshot data2 = querySnapshot.docs[0];
      name = data2['name'];
    } else {
      // Handle the case when no documents are found
      print('No documents found for the current user.');
      // You can set a default name or handle it in another way.
    }
    //  DocumentSnapshot data2 = querySnapshot.docs[0];
    // name = data2['name'];
    setState(() {});
  }

  @override
  void initState() {
    getData();
    getDataCourses();
    getDataTeacher();
    getDataStudent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 370,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 310,
            decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
          ),
          Positioned(
            top: 100,
            left: 20,
            child: Text("Hi ${name ?? 'Admin'}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white)),
          ),
          const Positioned(
            top: 95,
            right: 10,
            child: PicAdminHome(),
          ),
          Positioned(
            top: 180,
            left: 20,
            right: 20,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: const Offset(0, 5.0)),
                  ]),
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.class_,
                        size: 37,
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${numberOfCourses ?? ''}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Courses",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.person,
                        size: 37,
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${numberOfTeachers ?? ''}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Teachers",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Icon(
                        Icons.school,
                        size: 37,
                        color: kPrimaryColor,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                         "${numberOfStudents ?? ''}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Students",
                        style: TextStyle(fontSize: 15),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
