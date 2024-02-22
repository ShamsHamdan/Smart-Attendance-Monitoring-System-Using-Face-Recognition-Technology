import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatefulWidget {
  final String courseId;
  const CourseDetails({super.key, required this.courseId});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  List<QueryDocumentSnapshot> data = [];
  String? time;
  String? days;
  String? room;
  
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
    time = dataofcourse["time"];
    days=dataofcourse["date"];
     room=dataofcourse["room"];

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
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: kPrimaryColor, // Replace with your desired color
            width: .5, // Replace with your desired width
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(0, 5.0)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 37,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                   room ?? '',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 37,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    time ?? '',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 37,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    days ?? '',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
