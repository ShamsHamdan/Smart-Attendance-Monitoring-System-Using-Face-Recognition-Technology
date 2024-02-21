import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/Course_Teacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/CourseInTeacherTabNav.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RecntlyAccessedCourses extends StatefulWidget {
  const RecntlyAccessedCourses({super.key});

  @override
  State<RecntlyAccessedCourses> createState() => _RecntlyAccessedCoursesState();
}

class _RecntlyAccessedCoursesState extends State<RecntlyAccessedCourses> {
  List<QueryDocumentSnapshot> data = [];
  num? numofabsent;
  num? numofattending;
  List<QueryDocumentSnapshot> dataOfAttendance = [];
  List<QueryDocumentSnapshot> dataOfCourses = [];
  List<QueryDocumentSnapshot> dataOfStudent = [];
  int? numofstudent;
  bool isLoading = false;
  String? docId;

  Future getData() async {
     setState(() {  isLoading = true;});
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    data.addAll(querySnapshot.docs);
    docId = data[0].id;

    QuerySnapshot querySnapshott = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .get();

    dataOfCourses.addAll(querySnapshott.docs);

    setState(() {  isLoading = false;});

  }

  @override
  void initState() {
    getData();
   
    super.initState();
  }

  @override
Widget build(BuildContext context) {
  double attendancePercentage = .75;
  bool isLowAttendance = attendancePercentage <= 0.5;
  
  return Column(
    children: [
      SizedBox(
        height: 60,
      ),
      Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            "Recently Added Courses",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 25,
              fontWeight: FontWeight.bold)),
        ],
      ),
      SizedBox(
        height: 30,
      ),
      Align(
        alignment: dataOfCourses.length == 1 ? Alignment.centerLeft : Alignment.center,
        child: isLoading
            ? CircularProgressIndicator() // Show loading indicator
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: dataOfCourses.map((courseDoc) {
                    final imageUrl = courseDoc['url'];
                    return Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseInTeacherTabNav(courseId: courseDoc.id),
                            ),
                          );
                        },
                        child: Container(
                          width: 340,
                          margin: EdgeInsets.only(bottom: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0, 0),
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Material(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    width: double.infinity,
                                    height: 130,
                                    child: imageUrl.isNotEmpty
                                        ? Image.network(
                                            imageUrl,
                                            fit: BoxFit.cover,
                                            scale: 1.0,
                                          )
                                        : Image.asset(
                                            AssetsData.webcourse, // Default image asset
                                            fit: BoxFit.cover,
                                          ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    height: 110,
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            courseDoc['name'],
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "EIT",
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            courseDoc['idCourse'],
                                            style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
      ),
    ],
  );
}

}
