import 'package:first_version/features/Splash/presentation/views/SplashView.dart';
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
    );
  }
}