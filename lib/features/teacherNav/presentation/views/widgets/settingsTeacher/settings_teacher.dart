import 'package:first_version/constants.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/settings_teacher_body.dart';
import 'package:flutter/material.dart';

class SettingsTeacher extends StatelessWidget {
  const SettingsTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 24, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true, // Empty title
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Colors.grey[100],

      body:const SettingsTeacherBody());
  }
}







