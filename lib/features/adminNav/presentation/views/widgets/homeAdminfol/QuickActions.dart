import 'package:first_version/constants.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/courseAdmin/add_course_form_page.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/adminchart.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/TabNavAddTeacherandCourse.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/add_professor_form.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_teacheres_Admin.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class QuickActions extends StatelessWidget {
  final ScrollController scrollController;
  const QuickActions({super.key, required this.scrollController});
 
  // void scrollToChart() {
  //   // Access the RenderObject of the chart widget
  //   final RenderBox? chartBox = _chartKey.currentContext?.findRenderObject() as RenderBox?;
  //   if (chartBox != null) {
  //     // Calculate the position of the chart widget within the SingleChildScrollView
  //     final chartPosition = chartBox.localToGlobal(Offset.zero, ancestor: context.findRenderObject());
  //     // Scroll to the position of the chart widget
  //     scrollController.animateTo(
  //       chartPosition.dy, // Use dy for vertical scrolling
  //       duration: Duration(milliseconds: 500),
  //       curve: Curves.easeInOut,
  //     );
  //   }
  // }
  
 



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddProfessorForm()));
              //Navigator.pushNamed(context, "/maintabcoursesinteacher");
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xFFE4E7EC),
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    radius: 30,
                    child: Icon(
                      Icons.person_outline,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "Add Teacher",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddTeacherandCourseInAdminTabNav(
                    initialIndex: 1,
                  ),
                ),
              );
              //Navigator.pushNamed(context, "/maintabcoursesinteacher");
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xFFE4E7EC),
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    radius: 30,
                    child: Icon(
                      Icons.library_books_outlined,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "Add Course ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
             // (AdminChart context) => context.scrollToChart();
              Scrollable.ensureVisible(
                context,
                duration: Duration(seconds: 2),
                curve: Curves.easeInOut,
                alignment: -1,
              );
              // scrollController.animateTo(
              //   scrollController.position.maxScrollExtent,
              //   duration: Duration(seconds: 1),
              //   curve: Curves.easeInOut,
              // );
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: const Color(0xFFE4E7EC),
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    radius: 30,
                    child: Icon(
                      Icons.bar_chart,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "Statistics",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ),

          //   GestureDetector(
          //   onTap: () {
          //     scrollController.animateTo(
          //       scrollController.position.maxScrollExtent,
          //       duration: const Duration(seconds: 2),
          //       curve: Curves.easeInOut,
          //     );
          //   },
          //   child: Column(
          //     children: [
          //       Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(50),
          //           border: Border.all(
          //             color: const Color(0xFFE4E7EC),
          //             width: 2,
          //           ),
          //         ),
          //         child: const CircleAvatar(
          //           backgroundColor: Color.fromRGBO(255, 255, 255, 1),
          //           radius: 30,
          //           child: Icon(
          //             Icons.bar_chart,
          //             color: kPrimaryColor,
          //             size: 30,
          //           ),
          //         ),
          //       ),
          //       const SizedBox(height: 7),
          //       const Text(
          //         "Statistics",
          //         style: TextStyle(
          //           color: Color.fromARGB(255, 0, 0, 0),
          //           fontSize: 17,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Column(
          //   children: [
          //     Container(
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(50),
          //         border: Border.all(
          //           color: Color(0xFFE4E7EC),
          //           width: 2,
          //         ),
          //       ),
          //       child: CircleAvatar(
          //         backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
          //         radius: 30,
          //         child: Icon(
          //           Icons.bar_chart,
          //           color: kPrimaryColor,
          //           size: 30,
          //         ),
          //       ),
          //     ),
          //     SizedBox(height: 7),
          //     const Text(
          //       "Statistics",
          //       style: TextStyle(
          //         color: Color.fromARGB(255, 0, 0, 0),
          //         fontSize: 17,
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
