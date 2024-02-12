import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/CourseInTeacherTabNav.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarMainTeacher extends StatefulWidget {
  const CalendarMainTeacher({Key? key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<CalendarMainTeacher> {
  
  DateTime today = DateTime.now();
  DateTime selectedDay = DateTime.now();
  bool showList = false;

  List<QueryDocumentSnapshot> data = [];
  List<QueryDocumentSnapshot> dataOfCourses = [];
  String? docId;

  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    data.addAll(querySnapshot.docs);
    docId = data[0].id;

    QuerySnapshot querySnapshotCourses = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .get();

    dataOfCourses.addAll(querySnapshotCourses.docs);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("hi main cal");
  }

  List<QueryDocumentSnapshot> getCoursesForSelectedDay(DateTime selectedDay) {
    String selectedDayString = getDayString(selectedDay);
    return dataOfCourses
        .where((course) => course['date'].contains(selectedDayString))
        .toList();
  }

  String getDayString(DateTime day) {
    switch (day.weekday) {
      case DateTime.monday:
        return 'Mon';
      case DateTime.tuesday:
        return 'Tue';
      case DateTime.wednesday:
        return 'Wed';
      case DateTime.thursday:
        return 'Thu';
      case DateTime.friday:
        return 'Fri';
      case DateTime.saturday:
        return 'Sat';
      case DateTime.sunday:
        return 'Sun';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calendar",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
        ),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        iconTheme: IconThemeData(opacity: 0),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              child: TableCalendar(
                locale: "en_US",
                rowHeight: 43,
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2025, 3, 14),
                onDaySelected: (selected, focused) {
                  setState(() {
                    selectedDay = selected;
                    showList = isSameDay(selected, today);
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 50),
          if (showList)
            Expanded(
              child: ListView.builder(
                itemCount: getCoursesForSelectedDay(selectedDay).length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot course =
                      getCoursesForSelectedDay(selectedDay)[index];
                  return GestureDetector(
                    onTap: () {
                      // Handle tile click here
                      print('Tile $index clicked');
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CourseInTeacherTabNav(
                              courseId: course.id)),
                    );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        margin: EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          title: Text(course['name']),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          else
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 50,
                    color: kPrimaryColor,
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Select the day to choose the course",
                    style: TextStyle(fontSize: 18, color: kPrimaryColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}


















// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:first_version/constants.dart';
// import 'package:flutter/material.dart';

// import 'package:table_calendar/table_calendar.dart';

// class CalendarMainTeacher extends StatefulWidget {
//   const CalendarMainTeacher({Key? key});

//   @override
//   _HistoryPageState createState() => _HistoryPageState();
// }

// class _HistoryPageState extends State<CalendarMainTeacher> {
//   DateTime today = DateTime.now();
//   DateTime selectedDay = DateTime.now();
//   bool showList = false;

//   List<QueryDocumentSnapshot> data = [];

//   List<QueryDocumentSnapshot> dataOfCourses = [];

//   String? docId;

//   Future getData() async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('Teachers')
//         .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .get();

//     data.addAll(querySnapshot.docs);
//     docId = data[0].id;

//     QuerySnapshot querySnapshott = await FirebaseFirestore.instance
//         .collection('Teachers')
//         .doc(docId)
//         .collection('courses')
//         .get();

//     dataOfCourses.addAll(querySnapshott.docs);

//     setState(() {});
//   }

//   @override
//   void initState() {
//     super.initState();
//     print("hi main cal");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Calendar",
//           style: TextStyle(
//               color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
//         ),
//         backgroundColor: kPrimaryColor,
//         centerTitle: true,
//         iconTheme: IconThemeData(opacity: 0),
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 16.0),
//             child: Container(
//               child: TableCalendar(
//                 locale: "en_US",
//                 rowHeight: 43,
//                 headerStyle: const HeaderStyle(
//                   formatButtonVisible: false,
//                   titleCentered: true,
//                 ),
//                 availableGestures: AvailableGestures.all,
//                 selectedDayPredicate: (day) => isSameDay(day, today),
//                 focusedDay: today,
//                 firstDay: DateTime.utc(2010, 10, 16),
//                 lastDay: DateTime.utc(2025, 3, 14),
//                 onDaySelected: (selected, focused) {
//                   setState(() {
//                     selectedDay = selected;
//                     showList = isSameDay(selected, today);
//                   });
//                 },
//               ),
//             ),
//           ),
//           const SizedBox(height: 50),
//           if (showList)
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 3,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     onTap: () {
//                       // Handle tile click here
//                       print('Tile $index clicked');
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           color: Colors.grey,
//                           width: 1.0,
//                         ),
//                         borderRadius: BorderRadius.circular(8.0),
//                       ),
//                       margin: EdgeInsets.symmetric(vertical: 4.0),
//                       child: ListTile(
//                         title: Text('List Item $index'),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             )
//           else
//             Container(
//               margin: const EdgeInsets.all(16),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(
//                     Icons.calendar_today,
//                     size: 50,
//                     color: kPrimaryColor,
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     "Select the day to take attendance",
//                     style: TextStyle(fontSize: 18, color: kPrimaryColor),
//                     textAlign: TextAlign.center,
//                   ),
//                 ],
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
