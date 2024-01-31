import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/RecntlyAccessedCoursesINTeacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/chartallstudentTea.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/homenew.dart';

import 'package:flutter/material.dart';

// class HomeTeacher extends StatefulWidget {
//   const HomeTeacher({super.key,});

//   @override
//   State<HomeTeacher> createState() => _HomeTeacherState();
// }

// class _HomeTeacherState extends State<HomeTeacher> {
//   final PageController _pageController = PageController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print("hello");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Color.fromRGBO(238, 238, 238, 1),
//         body: PageView(controller: _pageController, children: [
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(height: 300, child: HomeTeacherHeader()),
//                 RecntlyAccessedCourses(),
//                 // ListCourses(),
//                 TeacherHomeChart(),
//               ],
//             ),
//           ),
//         ]));
//   }
// }

class HomeTeacher extends StatelessWidget {
   HomeTeacher ({super.key, required this.pageController});
   final PageController pageController ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(238, 238, 238, 1),
        body: PageView(controller: pageController, children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 300, child: HomeTeacherHeader()),
                RecntlyAccessedCourses(),
                // ListCourses(),
                TeacherHomeChart(),
              ],
            ),
          ),
        ]));
  }
}