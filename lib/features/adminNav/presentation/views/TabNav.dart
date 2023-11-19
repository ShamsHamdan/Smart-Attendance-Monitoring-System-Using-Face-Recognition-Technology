import 'package:first_version/constants.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/courseAdmin.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdmin.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teachersAdmin.dart';
import 'package:flutter/material.dart';

class TabNavigation extends StatelessWidget {
@override
Widget build(BuildContext context) {
return DefaultTabController(
length: 4,
child: Scaffold(
body: TabBarView(
children: <Widget>[
HomeAdmin(),
TeacherAdmin(),
CourseAdmin(),
SettingsAdmin(),
],
),






bottomNavigationBar: Material(

color:Colors.grey[100],
child: TabBar(tabs: const <Widget>[
Tab(icon: Icon(Icons.home,size: 30,)),
Tab(icon: Icon(Icons.person,size: 30,)),
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