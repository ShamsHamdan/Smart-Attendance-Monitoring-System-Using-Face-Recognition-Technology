import 'package:first_version/constants.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/Course_Teacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/Home_Teacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/mainCalendar/mainCalTeacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/settings_teacher.dart';
import 'package:flutter/material.dart';


class TabNavigationTeacher extends StatefulWidget {
  final int initialIndex;

  const TabNavigationTeacher({
    Key? key,
    required this.initialIndex,
  }) : super(key: key);

  @override
  _TabNavigationTeacherState createState() => _TabNavigationTeacherState();
}

class _TabNavigationTeacherState extends State<TabNavigationTeacher>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4, initialIndex: widget.initialIndex, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          HomeTeacher(),
          CalendarMainTeacher(),
          CourseTeacher(),
          SettingsTeacher(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Switch to the Calendar tab when the camera button is pressed
          _tabController.animateTo(1);
        },
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        heroTag: null, // Add this line to remove the tag
        elevation: 0.0, // Add this line to remove the shadow
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0), // Adjust the border radius
        ),
        // Adjust the size using size and padding
        mini: false,
        child: const Icon(Icons.camera_alt),
      ),
      bottomNavigationBar: Container(
        color: Colors.grey[100],
        height: 50,
        child: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(icon: Icon(Icons.home, size: 30)),
            Tab(icon: Icon(Icons.calendar_month, size: 30)),
            Tab(icon: Icon(Icons.school, size: 30)),
            Tab(icon: Icon(Icons.settings, size: 30)),
          ],
          indicator: const BoxDecoration(),
          labelColor: kPrimaryColor,
          
          unselectedLabelColor: const Color.fromRGBO(158, 158, 158, 1),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}





