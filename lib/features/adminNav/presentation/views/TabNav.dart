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
color: kPrimaryColor,
child: TabBar(tabs: const <Widget>[
Tab(icon: Icon(Icons.home)),
Tab(icon: Icon(Icons.person)),
Tab(icon: Icon(Icons.school)),
Tab(icon: Icon(Icons.settings))
]),
),
),
);
}
}