import 'package:first_version/constants.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_added_courses.dart';
//import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_courses_inSemester.dart';

import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_teacheres_Admin.dart';

import 'package:flutter/material.dart';


class AddTeacherandCourseInAdminTabNav extends StatefulWidget {
  final int initialIndex;

  const AddTeacherandCourseInAdminTabNav({Key? key, required this.initialIndex})
      : super(key: key);

  @override
  State<AddTeacherandCourseInAdminTabNav> createState() =>
      _AddTeacherandCourseInAdminTabNavState();
}

class _AddTeacherandCourseInAdminTabNavState
    extends State<AddTeacherandCourseInAdminTabNav>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 2, initialIndex: widget.initialIndex, vsync: this);
    _tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        backgroundColor: Colors.grey[100],
        title: const Text(
          'Computer systems Engineering',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              child: Text(
                'Added Courses',
                style: TextStyle(
                    color:
                        _tabController.index == 0 ? kPrimaryColor : Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            Tab(
              child: Text(
                'Add Teacher',
                style: TextStyle(
                    color:
                        _tabController.index == 1 ? kPrimaryColor : Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
          ],
          labelColor: kPrimaryColor,
          unselectedLabelColor: Colors.amber,
          indicator: const BoxDecoration(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children:  <Widget>[
          ListofAddedCourses(),
          ListOfTeacherPageInAdmin(),
        ],
      ),
    );
  }
}




// class   AddTeacherandCourseInAdminTabNav extends StatefulWidget {
//   const AddTeacherandCourseInAdminTabNav({super.key});

//   @override
//   State<AddTeacherandCourseInAdminTabNav> createState() => _CourseInTeacherTabNavState();
// }

// class _CourseInTeacherTabNavState extends State<AddTeacherandCourseInAdminTabNav>  with SingleTickerProviderStateMixin {
//   late TabController _tabController;

//   int _selectedIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//     _tabController.addListener(() {
//       if (_tabController.indexIsChanging) {
//         setState(() {
//           _selectedIndex = _tabController.index;
//         });
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
          
//            iconTheme: IconThemeData(color: Colors.black),
//           centerTitle: true,
//           backgroundColor: Colors.grey[100],
          
//           title: Text(
//             'Computer systems Engineering',
//             style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20),
//           ),
//           bottom: TabBar(
//             controller: _tabController,
//             tabs: <Widget>[
//               Tab(
//                   child: Text(
//                 'Add Course',
//                 style: TextStyle(
//                    color: 0 == _selectedIndex ? kPrimaryColor : Colors.grey,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               )),
//               Tab(
//                   child: Text(
//                 'Add Teacher',
//                 style: TextStyle(
//                   color: 1 == _selectedIndex ? kPrimaryColor : Colors.grey,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18),
//               )),
             
//             ],

//             labelColor:
//                 kPrimaryColor, // Set the color you want for the selected tab text
//             unselectedLabelColor: Colors.amber,
//             indicator: BoxDecoration(
//                 // color: kPrimaryColor, // Set the color you want for the selected tab
//                 ),
//           ),
//         ),
//         body: TabBarView(
//           controller: _tabController,
//           children: <Widget>[
//           ListofAddedCourses(),
//           ListOfTeacherPageInAdmin(),
//           ],
//         ),
//       ),
//     );
//   }
// }