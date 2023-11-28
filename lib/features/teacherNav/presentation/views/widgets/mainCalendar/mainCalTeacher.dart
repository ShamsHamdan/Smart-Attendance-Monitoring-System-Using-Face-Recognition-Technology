import 'package:first_version/constants.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calendar",
          style: TextStyle(color: Colors.white),
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle tile click here
                      print('Tile $index clicked');
                    },
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
                        title: Text('List Item $index'),
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
                    "Select the day to take attendance",
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





