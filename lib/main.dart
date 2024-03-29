
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:first_version/features/Splash/presentation/views/SplashView.dart';
import 'package:first_version/features/adminNav/presentation/views/TabNav.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/ChangePasswordAdmin.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/Terms%20_and_Conditions.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/editProfileadmin.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/TabNavAddTeacherandCourse.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const smartAttendance());
}

class smartAttendance extends StatefulWidget {
  const smartAttendance({super.key});

  @override
  State<smartAttendance> createState() => _smartAttendanceState();
}

class _smartAttendanceState extends State<smartAttendance> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('--------User is currently signed out!');
      } else {
        print('--------User is signed in!');
      }
    });
   // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
      routes: {
        // '/':(context) => const getStarted(),
        "/loginTeacher": (context) => const loginTeacher(),
        "/loginAdmin": (context) => const adminLoginRegstrationBody(),
        "/homeadmin": (context) => TabNavigation(selectedIndex: 0,),
        "/changepassowrdadmin": (context) => ChangePasswordAdmin(),
        "/editProfileadmin": (context) => EditProfileadmin(),
        "/TermsandConditions": (context) => TermsandConditions(),
       // "/homeTeacher": (context) => TabNavigationTeacher(initialIndex: 0,),
        "/editProfileteacher": (context) => EditProfileTeacher(),
        "/changepassowrdteacher": (context) => ChangePasswordTeacher(),
        "/PrivacyPolicy": (context) => PrivacyPolicy(),
        "/backwelcompage": (context) => getStarted(),
        "/maincalendar": (context) => CalendarMainTeacher(),
      //  "/CourseInTeacherTabNav": (contex) => CourseInTeacherTabNav(courseId: null,),
        "/maintabcoursesinteacher": (context) => CourseTeacher(),
       // "/reslutofattendance": (context) => ReslutOfAttendans(),
        //   '/specialties': (context) => ListOfSpecialtiesTeacher(),
        "/Teachers": (context) => ListOfTeacherPageInAdmin(),
        // '/addProfessor': (context) => AddProfessorForm(),
        //  '/listOfSpecialties': (context) => ListOfSpecialtiesTeacher(),
        
        '/recnAddCoursesInAdmin': (context) => ListofAddedCourses(),
        '/addNavInAdmin': (context) => AddTeacherandCourseInAdminTabNav(initialIndex: 0,),
      },
    );
  }
}
