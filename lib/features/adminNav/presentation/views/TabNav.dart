
import 'package:first_version/constants.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/homeAdmin.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/settingsAdmin.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/facultiesAdmin.dart';
import 'package:flutter/material.dart';

class TabNavigation extends StatefulWidget {
  final int selectedIndex;

  const TabNavigation({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 3, initialIndex: widget.selectedIndex, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const <Widget>[
          HomeAdmin(),
          ListOfFacultiesAdmin(),
          SettingsAdmin(),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.grey[100],
        child: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.library_add,
                size: 30,
              ),
            ),
            Tab(
              icon: Icon(
                Icons.settings,
                size: 30,
              ),
            )
          ],
          indicator: const BoxDecoration(),
          labelColor:kPrimaryColor, 
          unselectedLabelColor: Colors.grey,
        ),
      ),
    );
  }
}




// import 'package:first_version/constants.dart';
// import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/homeAdmin.dart';
// import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/settingsAdmin.dart';
// import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/facultiesAdmin.dart';
// import 'package:flutter/material.dart';

// class TabNavigation extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         body: TabBarView(
//           children: <Widget>[
//             HomeAdmin(),
//            ListOfFacultiesAdmin(),
//            // CourseAdmin(),
//             SettingsAdmin(),
//           ],
//         ),
//         bottomNavigationBar: Material(
//           color: Colors.grey[100],
//           child: TabBar(
//             tabs: const <Widget>[
//               Tab(
//                   icon: Icon(
//                 Icons.home,
//                 size: 30,
//               )),
//               Tab(
//                   icon: Icon(
//                 Icons.library_add,
//                 size: 30,
//               )),
//               // Tab(
//               //     icon: Icon(
//               //   Icons.school,
//               //   size: 30,
//               // )),
//               Tab(
//                   icon: Icon(
//                 Icons.settings,
//                 size: 30,
//               ))
//             ],
//             indicator: BoxDecoration(),
//             labelColor:
//                 kPrimaryColor, // Change this color to the desired color when pressed
//             unselectedLabelColor: Colors.grey,
//           ),
//         ),
//       ),
//     );
//   }
// }
