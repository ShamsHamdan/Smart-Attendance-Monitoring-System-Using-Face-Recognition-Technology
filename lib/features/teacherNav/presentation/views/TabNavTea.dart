import 'package:first_version/constants.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/Course_Teacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/Home_Teacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/mainCalendar/mainCalTeacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/settings_teacher.dart';
import 'package:flutter/material.dart';

class TabNavigationTeacher extends StatefulWidget {
  const TabNavigationTeacher({Key? key}) : super(key: key);

  @override
  _TabNavigationTeacherState createState() => _TabNavigationTeacherState();
}

class _TabNavigationTeacherState extends State<TabNavigationTeacher>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
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
        child: Icon(Icons.camera_alt),
        backgroundColor: kPrimaryColor,
         heroTag: null, // Add this line to remove the tag
  elevation: 0.0, // Add this line to remove the shadow
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0), // Adjust the border radius
  ),
  // Adjust the size using size and padding
  mini: false,
      ),
      bottomNavigationBar:  BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(icon: Icon(Icons.home, size: 30)),
              Tab(icon: Icon(Icons.calendar_month, size: 30)),
              Tab(icon: Icon(Icons.school, size: 30)),
              Tab(icon: Icon(Icons.settings, size: 30)),
            ],
            indicator: BoxDecoration(
             
            ),
            labelColor: kPrimaryColor,
            unselectedLabelColor: Colors.grey,
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


















// import 'package:first_version/constants.dart';
// import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/Course_Teacher.dart';
// import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/Home_Teacher.dart';
// import 'package:first_version/features/teacherNav/presentation/views/widgets/mainCalendar/mainCalTeacher.dart';
// import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/settings_teacher.dart';
// import 'package:flutter/material.dart';

// class TabNavigationTeacher extends StatelessWidget {
//   const TabNavigationTeacher({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         body: TabBarView(
//           children: <Widget>[
//             HomeTeacher(),
//             CalendarMainTeacher(),
//             CourseTeacher(),
//             SettingsTeacher(),
//           ],
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//              Navigator.pushNamed(
//                                   context, "/maincalendar");
//           },
//           child: Icon(Icons.camera_alt),
//           backgroundColor: kPrimaryColor,
//         ),
//         bottomNavigationBar: BottomAppBar(
//           shape: CircularNotchedRectangle(),
//           child: TabBar(
//             tabs: const <Widget>[
//               Tab(icon: Icon(Icons.home, size: 30)),
              
//               Tab(icon: Icon(Icons.calendar_month, size: 30)),
//               Tab(icon: Icon(Icons.school, size: 30)),
//               Tab(icon: Icon(Icons.settings, size: 30)),
//             ],
//             indicator: BoxDecoration(),
//             labelColor: kPrimaryColor,
//             unselectedLabelColor: Colors.grey,
//           ),
//         ),
//       ),
//     );
//   }
// }






























// import 'package:first_version/constants.dart';
// import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/Course_Teacher.dart';
// import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/Home_Teacher.dart';
// import 'package:first_version/features/teacherNav/presentation/views/widgets/mainCalendar/mainCalTeacher.dart';
// import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/settings_teacher.dart';
// import 'package:flutter/material.dart';

// class TabNavigationTeacher extends StatelessWidget {
//   const TabNavigationTeacher({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
// length: 4,
// child: Scaffold(
// body: TabBarView(
// children: <Widget>[
// HomeTeacher(),
// CalendarMainTeacher(),
// CourseTeacher(),
// SettingsTeacher(),
// ],
// ),


// bottomNavigationBar: Material(

// color:Colors.grey[100],
// child: TabBar(tabs: const <Widget>[
// Tab(icon: Icon(Icons.home,size: 30,)),
// Tab(icon: Icon(Icons.calendar_month,size: 30,)),
// Tab(icon: Icon(Icons.school,size: 30,)),
// Tab(icon: Icon(Icons.settings,size: 30,))
// ],
// indicator: BoxDecoration(),
//  labelColor: kPrimaryColor, // Change this color to the desired color when pressed
//         unselectedLabelColor: Colors.grey,

// ),
// ),
// ),
// );
//   }
// }