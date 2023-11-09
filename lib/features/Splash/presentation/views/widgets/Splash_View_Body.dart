import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsData.logowhite),
          Text("Attendance System",
              style: TextStyle(
                fontSize: 25.0,
                letterSpacing: 2,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ))
        ],
      ),
    );
  }
}
