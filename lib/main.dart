import 'package:first_version/features/Splash/presentation/views/SplashView.dart';
import 'package:first_version/features/adminlogin/presentation/views/widgets/admin_login_reg_body.dart';
import 'package:first_version/features/getStarted/presentation/views/get_Started.dart';
import 'package:first_version/features/loginTeacher/presentation/views/login_teacher.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const smartAttendance());
}

class smartAttendance extends StatelessWidget {
  const smartAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),

      routes: {
       // '/':(context) => const getStarted(),
        "/loginTeacher":(context) => const loginTeacher(),
        "/loginAdmin":(context) => const adminLoginRegstrationBody()
      },
    );
  }
}