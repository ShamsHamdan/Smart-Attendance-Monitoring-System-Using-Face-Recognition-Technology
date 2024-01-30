import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';

import 'package:table_calendar/table_calendar.dart';

class TeacherCoursHisstory extends StatefulWidget {
  const TeacherCoursHisstory({Key? key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<TeacherCoursHisstory> {
  Set<DateTime> markedDates = Set<DateTime>();
  DateTime today = DateTime.now();
  DateTime selectedDay = DateTime.now();
  bool showAttendance = false;

  DocumentSnapshot? data1;

  String? docId;
  String? courseId;
  int? numofattending;
  int? numofabsent;
  int? numofstudent;

  List<QueryDocumentSnapshot> dataOfatten = [];

  List<QueryDocumentSnapshot> dataOfCourses = [];

  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    DocumentSnapshot data1 = querySnapshot.docs[0];

    docId = data1.id;

    setState(() {});

    QuerySnapshot querySnapshott = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .get();

    dataOfCourses.addAll(querySnapshott.docs);
    courseId = dataOfCourses[0].id;
    setState(() {});
  }

  Future<void> getDataAtten() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Teachers')
          .doc(docId)
          .collection('courses')
          .doc(courseId)
          .collection('attendance')
          .get();

      dataOfatten.addAll(snapshot.docs);

      setState(() {
        print("$dataOfatten");
      });
    } catch (error) {
      print('Error getting attendance data: $error');
    }

    setState(() {});
  }

  DateTime parseDate(String dateString) {
    // Format your date string to match the actual format of your date
    // For example, if your date string is in the format "yyyy-MM-dd", you can use:
    // DateTime dateTime = DateTime.parse(dateString);
    // Make sure to adjust the format based on your actual date string format
    DateTime dateTime = DateTime.parse(dateString);

    return dateTime;
  }

  int getNumberOfAttending(DateTime date) {
    int attending = 0;

    for (var doc in dataOfatten) {
      DateTime docDate = parseDate(doc['date'] as String);

      if (isSameDay(docDate, date)) {
        attending = doc['attending'];
        break;
      }
    }

    return attending;
  }

  void populateMarkedDates() {
    for (var doc in dataOfatten) {
      DateTime docDate = parseDate(doc['date'] as String);
      print("$docDate");
      markedDates.add(docDate);
      print('markedDates$markedDates');
    }
  }

//   void populateMarkedDates() {
//   for (var dateString in dataOfatten) {
//     DateTime date = parseDate(dateString as String);
//     DateTime formattedDate = DateTime(date.year, date.month, date.day);
//     markedDates.add(formattedDate);
//      print("$formattedDate");
//     print("$markedDates");
//   }
// }

  int getNumberOfAbsent(DateTime date) {
    int absent = 0;

    for (var doc in dataOfatten) {
      DateTime docDate = parseDate(doc['date'] as String);

      if (isSameDay(docDate, date)) {
        absent = doc['absent'];
        break;
      }
    }

    return absent;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("hello");
    getData().then((_) => getDataAtten()).then(
          (_) => populateMarkedDates(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calendar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
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
                calendarBuilders: CalendarBuilders(
                  // Customize the appearance of the selected day
                  selectedBuilder: (context, date, _) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                  markerBuilder: (context, date, events) {
                    print('date$date');
                    return Stack(
                      children: [
                        if (markedDates.any((markedDate) => isSameDay(markedDate, date)))
                          Container(
                            height: 6,
                            width: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                       
                      ],
                    );  
                  },
                ),
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
                    showAttendance = true;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 50),
          if (showAttendance)
            Container(
              margin: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: kPrimaryColor,
              ),
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Details of attendance on this day",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Attending",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                            Text(
                              getNumberOfAttending(selectedDay).toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.8,
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Absent",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                            Text(
                              getNumberOfAbsent(selectedDay).toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
                    "Select a day to view attendance details.",
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





























// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:first_version/constants.dart';
// // import 'package:flutter/material.dart';

// // import 'package:table_calendar/table_calendar.dart';

// // class TeacherCoursHisstory extends StatefulWidget {
// //   const TeacherCoursHisstory({Key? key});

// //   @override
// //   _HistoryPageState createState() => _HistoryPageState();
// // }

// // class _HistoryPageState extends State<TeacherCoursHisstory> {
// //   DateTime today = DateTime.now();
// //   DateTime selectedDay = DateTime.now();
// //   bool showAttendance = false;

// //   DocumentSnapshot? data1;

// //   String? docId;
// //   String? courseId;
// //   int? numofattending;
// //   int? numofabsent;
// //   int? numofstudent;

// //   List<QueryDocumentSnapshot> dataOfatten = [];

// //   List<QueryDocumentSnapshot> dataOfCourses = [];

// //   Future getData() async {
// //     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
// //         .collection('Teachers')
// //         .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
// //         .get();

// //     DocumentSnapshot data1 = querySnapshot.docs[0];

// //     docId = data1.id;

// //     setState(() {});

// //     QuerySnapshot querySnapshott = await FirebaseFirestore.instance
// //         .collection('Teachers')
// //         .doc(docId)
// //         .collection('courses')
// //         .get();

// //     dataOfCourses.addAll(querySnapshott.docs);
// //     courseId = dataOfCourses[0].id;
// //     setState(() {});
// //   }

// //   Future<void> getDataAtten() async {
// //     try {
// //       QuerySnapshot snapshot = await FirebaseFirestore.instance
// //           .collection('Teachers')
// //           .doc(docId)
// //           .collection('courses')
// //           .doc(courseId)
// //           .collection('attendance')
// //           .get();

// //       dataOfatten.addAll(snapshot.docs);

// //       setState(() {});
// //     } catch (error) {
// //       print('Error getting attendance data: $error');
// //     }

// //     setState(() {});
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text("Calendar",
// //             style: TextStyle(
// //                 color: Colors.white,
// //                 fontSize: 24,
// //                 fontWeight: FontWeight.bold)),
// //         backgroundColor: kPrimaryColor,
// //         centerTitle: true,
// //         iconTheme: IconThemeData(opacity: 0),
// //       ),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.only(bottom: 16.0),
// //             child: Container(
// //               child: TableCalendar(
// //                 locale: "en_US",
// //                 rowHeight: 43,
// //                 headerStyle: const HeaderStyle(
// //                   formatButtonVisible: false,
// //                   titleCentered: true,
// //                 ),
// //                 availableGestures: AvailableGestures.all,
// //                 selectedDayPredicate: (day) => isSameDay(day, today),
// //                 focusedDay: today,
// //                 firstDay: DateTime.utc(2010, 10, 16),
// //                 lastDay: DateTime.utc(2025, 3, 14),
// //                 onDaySelected: (selected, focused) {
// //                   setState(() {
// //                     selectedDay = selected;
// //                     showAttendance = true;
// //                   });
// //                 },
// //               ),
// //             ),
// //           ),
// //           const SizedBox(height: 50),
// //           if (showAttendance && selectedDay.day == 15)
// //             Container(
// //               margin: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.only(
// //                   topLeft: Radius.circular(50),
// //                   bottomRight: Radius.circular(50),
// //                   topRight: Radius.circular(50),
// //                 ),
// //                 color: kPrimaryColor,
// //               ),
// //               padding: const EdgeInsets.only(top: 30, bottom: 30),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.stretch,
// //                 children: [
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: <Widget>[
// //                       Text(
// //                         " Details of attendance on this day",
// //                         style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 20,
// //                         ),
// //                       ),
// //                       // Text(
// //                       //   "     __________",
// //                       //   style: TextStyle(
// //                       //       color: Colors.white,
// //                       //       fontSize: 10,
// //                       //       fontWeight: FontWeight.w200),
// //                       // ),
// //                     ],
// //                   ),
// //                   SizedBox(
// //                     height: 10,
// //                   ),
// //                   FractionallySizedBox(
// //                     widthFactor: 0.8,
// //                     child: Card(
// //                       color: Colors.white,
// //                       child: Padding(
// //                         padding: EdgeInsets.all(8.0),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Text("Attending",
// //                                 style: TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     color: kPrimaryColor)),
// //                             Text("10",
// //                                 style: TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     color: kPrimaryColor)),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                   SizedBox(
// //                     height: 10,
// //                   ),
// //                   FractionallySizedBox(
// //                     widthFactor: 0.8,
// //                     child: Card(
// //                       color: Colors.white,
// //                       child: Padding(
// //                         padding: EdgeInsets.all(8.0),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             Text("Absent",
// //                                 style: TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     color: kPrimaryColor)),
// //                             Text("5",
// //                                 style: TextStyle(
// //                                     fontWeight: FontWeight.bold,
// //                                     color: kPrimaryColor)),
// //                           ],
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             )
// //           else
// //             Container(
// //               margin: const EdgeInsets.all(16),
// //               child: Column(
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Icon(
// //                     Icons.calendar_today,
// //                     size: 50,
// //                     color: kPrimaryColor,
// //                   ),
// //                   SizedBox(height: 16),
// //                   Text(
// //                     "Select a day to view attendance details.",
// //                     style: TextStyle(fontSize: 18, color: kPrimaryColor),
// //                     textAlign: TextAlign.center,
// //                   ),
// //                 ],
// //               ),
// //             ),
// //         ],
// //       ),
// //     );
// //   }
// // }
