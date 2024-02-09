import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/AdminHeader.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/QuickActions.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/RecentlyTeacher.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/RecntlyAddCourses.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/adminchart.dart';
import 'package:flutter/material.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class BodyHomeAdmin extends StatefulWidget {
  
  const BodyHomeAdmin({super.key});

  @override
  State<BodyHomeAdmin> createState() => _BodyHomeAdminState();
}

class _BodyHomeAdminState extends State<BodyHomeAdmin> {
  final AutoScrollController _scrollController = AutoScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
      HomeAdminHeader(),
      QuickActions(scrollController: _scrollController,),
      SizedBox(
        height: 30,
      ),
      RecntlyAddCourses(),
      SizedBox(
        height: 30,
      ),
   RecentlyAddTeachers(),
   AdminChart(),
    ]
    );
  }
}
