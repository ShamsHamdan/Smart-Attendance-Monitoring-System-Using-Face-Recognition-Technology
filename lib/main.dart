import 'package:first_version/features/Splash/presentation/views/SplashView.dart';
import 'package:first_version/features/adminNav/presentation/views/TabNav.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/courseAdmin/add_course_form_page.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/courseAdmin/list_of_courses_page.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/courseAdmin/list_of_specialties_courses.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/ChangePasswordAdmin.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/Terms%20_and_Conditions.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/editProfileadmin.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/add_professor_form.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_added_courses.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_departments.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_teacheres_Admin.dart';
import 'package:first_version/features/adminlogin/presentation/views/widgets/admin_login_reg_body.dart';
import 'package:first_version/features/getStarted/presentation/views/get_Started.dart';
import 'package:first_version/features/loginTeacher/presentation/views/login_teacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/TabNavTea.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/Course_Teacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/CourseInTeacherTabNav.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/ReslutBodyOfAttendans.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/mainCalendar/mainCalTeacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/ChangePasswordTeacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/PrivacyPolicy.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/editProfileteacher.dart';
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
        "/loginAdmin":(context) => const adminLoginRegstrationBody(),
        "/homeadmin":(context) => TabNavigation(),
        "/changepassowrdadmin":(context) => ChangePasswordAdmin(),
        "/editProfileadmin":(context) => EditProfileadmin(),
        "/TermsandConditions":(context) => TermsandConditions(), 
        "/homeTeacher":(context) => TabNavigationTeacher(),
        "/editProfileteacher":(context) => EditProfileTeacher(),
         "/changepassowrdteacher":(context) => ChangePasswordTeacher(),
         "/PrivacyPolicy":(context) => PrivacyPolicy(),
         "/backwelcompage":(context) => getStarted(),
         "/maincalendar":(context) => CalendarMainTeacher(),
          "/CourseInTeacherTabNav":(contex) => CourseInTeacherTabNav(),
    "/maintabcoursesinteacher":(context)=> CourseTeacher(),
        "/reslutofattendance":(context) => ReslutOfAttendans(),
       //   '/specialties': (context) => ListOfSpecialtiesTeacher(),
        "/Teachers": (context) => ListOfTeacherPageInAdmin(),
        // '/addProfessor': (context) => AddProfessorForm(),
       //  '/listOfSpecialties': (context) => ListOfSpecialtiesTeacher(),
        '/listOfCourses': (context) => ListOfCoursesPage(),
        '/addCourseForm': (context) => const AddCourseFormPage(),
        '/recnAddCoursesInAdmin':(context) =>  ListofAddedCourses(),
      },
    );
  }
}