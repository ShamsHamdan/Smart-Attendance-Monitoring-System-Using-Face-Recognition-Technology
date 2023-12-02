import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';

 import 'package:table_calendar/table_calendar.dart';
 class TeacherCoursHisstory extends StatefulWidget {
  const TeacherCoursHisstory({Key? key});

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<TeacherCoursHisstory> {
  DateTime today = DateTime.now();
  DateTime selectedDay = DateTime.now();
  bool showAttendance = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calendar", style: TextStyle(color: Colors.white)),
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
                    showAttendance = true;
                  });
                },
              ),
            ),
          ),
          const SizedBox(height: 50),

          if (showAttendance && selectedDay.day == 15)
            Container(
              margin: const EdgeInsets.only(top: 8, left: 8, bottom: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color:kPrimaryColor,
              ),
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        " Details of attendance on this day",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      // Text(
                      //   "     __________",
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 10,
                      //       fontWeight: FontWeight.w200),
                      // ),
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
                            Text("Attending", style: TextStyle(fontWeight: FontWeight.bold,color:kPrimaryColor )),
                            Text("10", style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor)),
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
                            Text("Absent", style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor )),
                            Text("5", style: TextStyle(fontWeight: FontWeight.bold,color: kPrimaryColor)),
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
                    style: TextStyle(fontSize: 18, color:kPrimaryColor),
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

  