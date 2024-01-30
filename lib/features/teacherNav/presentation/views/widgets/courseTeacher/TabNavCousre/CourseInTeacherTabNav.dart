import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/historyCourseTeacher/TeacherCoursHistory.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/TeacherCourseDiscripition.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/StudentCourseTeacher/TeacherCourseParticipants.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/historyCourseTeacher/TeacherCoursHistory.dart';
import 'package:flutter/material.dart';

class CourseInTeacherTabNav extends StatefulWidget {
  final String courseId;
  CourseInTeacherTabNav({super.key, required this.courseId});

  @override
  State<CourseInTeacherTabNav> createState() => _CourseInTeacherTabNavState();
}

class _CourseInTeacherTabNavState extends State<CourseInTeacherTabNav>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _selectedIndex = 0;
  List<QueryDocumentSnapshot> data = [];
  String? name;

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
    name = dataofcourse["name"];

    setState(() {
      // print("${data[0]['name']}");
      // Adminemail = data['email'];
      // Adminpass = data['password'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _selectedIndex = _tabController.index;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
          backgroundColor: Colors.grey[100],
          title: Text(
            '$name',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                  child: Text(
                'Course',
                style: TextStyle(
                    color: 0 == _selectedIndex ? kPrimaryColor : Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
              Tab(
                  child: Text(
                'Participants',
                style: TextStyle(
                    color: 1 == _selectedIndex ? kPrimaryColor : Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
              Tab(
                  child: Text(
                'History',
                style: TextStyle(
                    color: 2 == _selectedIndex ? kPrimaryColor : Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              )),
            ],

            labelColor:
                kPrimaryColor, // Set the color you want for the selected tab text
            unselectedLabelColor: Colors.amber,
            indicator: BoxDecoration(
                // color: kPrimaryColor, // Set the color you want for the selected tab
                ),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            TeacherCourseDiscripition(
              courseId: widget.courseId,
            ),
            TeacherCourseParticipants(
              courseId: widget.courseId,
            ),
            TeacherCoursHisstory(),
          ],
        ),

// bottomNavigationBar: Material(

// color:Colors.grey[100],
// child: TabBar(tabs: const <Widget>[
// Tab(icon: Icon(Icons.home,size: 30,)),
// Tab(icon: Icon(Icons.person,size: 30,)),
// Tab(icon: Icon(Icons.school,size: 30,)),
// Tab(icon: Icon(Icons.settings,size: 30,))
// ],
// indicator: BoxDecoration(),
//  labelColor: kPrimaryColor, // Change this color to the desired color when pressed
//         unselectedLabelColor: Colors.grey,
// ),
// ),
      ),
    );
  }
}
