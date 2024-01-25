import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class studentStatistics extends StatefulWidget {
  final String courseId;
//  final String teacherId;
  const studentStatistics(
      {super.key, required this.courseId});

  @override
  State<studentStatistics> createState() => _studentStatisticsState();
}

class _studentStatisticsState extends State<studentStatistics> {
  List<QueryDocumentSnapshot> data = [];
  List<QueryDocumentSnapshot> dataOfAttendance = [];
  num? numofabsent;
  num? numofattending;
  String?  docId;
  String? url;
   List<QueryDocumentSnapshot> dataOfStudent = [];
  int? numofstudent;

  //List<QueryDocumentSnapshot> dataOfCourses = [];
  Future getData() async {

 QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    data.addAll(querySnapshot.docs);
     docId = data[0].id;

 QuerySnapshot querySnapshotStu = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .doc(widget.courseId)
        .collection('students')
        .get();

    dataOfStudent.addAll(querySnapshotStu.docs);
    numofstudent = dataOfStudent.length;


    QuerySnapshot querySnapshotAtt = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .doc(widget.courseId)
        .collection('attendance')
        .orderBy('date',
            descending: true) // Order documents by date in descending order
        .limit(1)
        .get();

    dataOfAttendance.addAll(querySnapshotAtt.docs);
    if (dataOfAttendance.isNotEmpty) {
  numofabsent = dataOfAttendance[0]['absent'] ?? 0;
  numofattending = dataOfAttendance[0]['attending'] ?? 0;
} else {
  numofabsent = 0;
  numofattending = 0;
}
   
    setState(() {
      print("$numofabsent$numofattending");
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
    return Column(
      //  mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text("Attendance Ratio",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: 20,
        ),
        // Text("Weekly Attendance",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularPercentIndicator(
                radius: 70,
                lineWidth: 15,
            percent: numofstudent != null && numofattending != null && numofstudent != 0 ? (numofattending! / numofstudent!) : 0,// (numofattending!* 100).toInt(),
                center:  Text(//" ",
"${(numofattending != null && numofstudent != null && numofstudent != 0 ? ((numofattending! / numofstudent!) * 100).toInt() : 0)}%" ?? '0',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green),
                ),
                footer: const Text(
                  'Attendance',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.green,
                animation: true,
                animationDuration: 4000,
              ),
              const SizedBox(
                width: 30,
              ),
              CircularPercentIndicator(
                radius: 70,
                lineWidth: 15,
                percent:  numofstudent != null && numofabsent != null ? (numofabsent! / numofstudent!) : 0,
                center: Text(
            "${(numofabsent != null && numofstudent != null && numofstudent != 0 ? ((numofabsent! / numofstudent!) * 100).toInt() : 0)}%" ?? '0',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.red),
                ),
                footer: const Text(
                  'Absent',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.red,
                animation: true,
                animationDuration: 4000,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
