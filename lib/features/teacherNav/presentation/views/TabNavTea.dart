import 'package:first_version/constants.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/Course_Teacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/homeTeacher/Home_Teacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/settings_teacher.dart';
import 'package:flutter/material.dart';

class TabNavigationTeacher extends StatelessWidget {
  const TabNavigationTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
length: 3,
child: Scaffold(
body: TabBarView(
children: <Widget>[
HomeTeacher(),
CourseTeacher(),
SettingsTeacher(),
],
),


bottomNavigationBar: Material(

color:Colors.grey[100],
child: TabBar(tabs: const <Widget>[
Tab(icon: Icon(Icons.home,size: 30,)),
Tab(icon: Icon(Icons.school,size: 30,)),
Tab(icon: Icon(Icons.settings,size: 30,))
],
indicator: BoxDecoration(),
 labelColor: kPrimaryColor, // Change this color to the desired color when pressed
        unselectedLabelColor: Colors.grey,

),
),
),
);
  }
}