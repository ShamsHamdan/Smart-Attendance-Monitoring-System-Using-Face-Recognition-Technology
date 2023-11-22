import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/AdminHeader.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/QuickActions.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/RecentlyTeacher.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/homeAdminfol/RecntlyAddCourses.dart';
import 'package:flutter/material.dart';

class BodyHomeAdmin extends StatelessWidget {
  const BodyHomeAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
     children: [
      HomeAdminHeader(),
      QuickActions(),
      SizedBox(
        height: 30,
      ),
      RecntlyAddCourses(),
      SizedBox(
        height: 30,
      ),
   RecentlyAddTeachers(),
    ]
    );
  }
}
