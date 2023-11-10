import 'package:first_version/features/loginTeacher/presentation/views/widgets/login_teacher_body.dart';
import 'package:flutter/material.dart';

class loginTeacher extends StatelessWidget {
  const loginTeacher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginTeacherBody(),
    );
  }
}