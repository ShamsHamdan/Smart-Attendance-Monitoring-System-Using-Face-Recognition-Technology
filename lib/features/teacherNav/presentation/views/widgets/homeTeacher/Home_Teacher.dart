import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/RecntlyAccessedCoursesINTeacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/chartallstudentTea.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/homenew.dart';

import 'package:flutter/material.dart';

class HomeTeacher extends StatefulWidget {
  const HomeTeacher({super.key,});

  @override
  State<HomeTeacher> createState() => _HomeTeacherState();
}

class _HomeTeacherState extends State<HomeTeacher>   {
 //final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hello");
  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Color.fromRGBO(238, 238, 238, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 300, child: HomeTeacherHeader()),
              RecntlyAccessedCourses(),
              // ListCourses(),
              TeacherHomeChart(),
            ],
          ),
        ));
  }
}







// class HomeTeacher extends StatefulWidget {
//   HomeTeacher({Key? key, required this.pageController}) : super(key: key);
//   final PageController pageController;
//   static final GlobalKey<_HomeTeacherState> homekey =
//       GlobalKey<_HomeTeacherState>();

//   @override
//   State<HomeTeacher> createState() => _HomeTeacherState();
// }

// class _HomeTeacherState extends State<HomeTeacher> {
//   @override
//   void initState() {
//     super.initState();
//     print("home");
//   }

//   // Recursively rebuild all child widgets
//   void _rebuildAllChildren(BuildContext context) {
//     if (context.owner is RenderBox) {
//       (context.owner as RenderBox).markNeedsPaint();
//     }
//     context.visitChildElements((element) {
//       _rebuildAllChildren(element);
//     });
//   }

//   // Call this method to force a rebuild of all child widgets
//   void rebuild() {
//     _rebuildAllChildren(context);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(238, 238, 238, 1),
//       body: PageView(controller: widget.pageController, children: [
//         SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: 300,
//                 child: HomeTeacherHeader(
//                   key: UniqueKey(),
//                 ),
//               ),
//               RecntlyAccessedCourses(),
//               // ListCourses(),
//               TeacherHomeChart(),
//             ],
//           ),
//         ),
//       ]),
//     );
//   }
// }


