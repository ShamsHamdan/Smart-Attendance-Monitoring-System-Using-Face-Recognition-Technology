
import 'package:first_version/constants.dart';
import 'package:first_version/features/Splash/presentation/views/widgets/Splash_View_Body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColor,
      body: SplashViewBody(),
    );
  }
}