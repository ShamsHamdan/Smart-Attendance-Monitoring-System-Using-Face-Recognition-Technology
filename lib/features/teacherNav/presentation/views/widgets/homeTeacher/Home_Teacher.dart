import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/RecntlyAccessedCoursesINTeacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/chartallstudentTea.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/homeHeader.dart';
import 'package:flutter/material.dart';

class HomeTeacher extends StatefulWidget {
  const HomeTeacher({Key? key}) : super(key: key);

  @override
  State<HomeTeacher> createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      print("hello i am home body");
      // Call your data fetching methods here
      // getData();
      // getDataAtten();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Use WillPopScope to listen for route changes
    return WillPopScope(
      onWillPop: () async {
        // Trigger data fetching methods when widget becomes visible
        if (ModalRoute.of(context)?.isCurrent == true) {
          // Call your data fetching methods here
          // getData();
          // getDataAtten();
          print("Widget is visible");
        }
        return true;
      },
      child: Scaffold(
        backgroundColor: Color.fromRGBO(238, 238, 238, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 300, child: HomeTeacherHeader()),
              RecntlyAccessedCourses(),
              TeacherHomeChart(),
            ],
          ),
        ),
      ),
    );
  }
}

