import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/add_course_form.dart';

import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_courses_inSemester.dart';
import 'package:flutter/material.dart';

class ListofAddedCourses extends StatefulWidget {
  const ListofAddedCourses({super.key});

  @override
  State<ListofAddedCourses> createState() => _ListofAddedCoursesState();
}

class _ListofAddedCoursesState extends State<ListofAddedCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('List of added Courses',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
          
            Expanded(
              child: ListView(
                children: [
                  buildCourseContainer('ARTIFICIAL INTELLIGENCE', ' 1955211512', Colors.white, kPrimaryColor, 'assets/images/graduation.jpeg',kPrimaryColor, context),
            buildCourseContainer('MACHINE LEARNING', ' 1225276512', Colors.white, kPrimaryColor, 'assets/images/graduation.jpeg', kPrimaryColor, context),
            buildCourseContainer('EMBEDDED SYSTEMS', ' 1955888222', Colors.white, kPrimaryColor, 'assets/images/graduation.jpeg', kPrimaryColor, context),
            buildCourseContainer('TECHNICAL WRITING', ' 3395245612', Colors.white, kPrimaryColor, 'assets/images/graduation.jpeg', kPrimaryColor, context),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
           
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),
    );
  }
 Widget buildCourseContainer(String name, String subtitle, Color containerColor, Color textColor, String imagePath, Color iconColor, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: containerColor,
      ),
      child: ListTile(
        title: Text(name, style: TextStyle(color: textColor,fontSize: 18,fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle, style: TextStyle(color: textColor,fontSize: 17)),
        trailing: GestureDetector(
          onTap: () {
            // Show dialog here
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Teacher: Mohammad Awad',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        const Text('Faculty:EIT',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                        SizedBox(height: 10,),
                        const Text('Department:CSE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

                  //       const SizedBox(height: 20),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           ElevatedButton(
                  //             onPressed: () {
                  //               // Handle Add button press
                                
                  //               Navigator.of(context).pop();
                  //             },
                  //             style:  ButtonStyle(
                  //   backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                  //   padding: MaterialStateProperty.all(
                  //       EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                  //   shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(27))),
                  // ),
                  //             child: const Text('Add', style: TextStyle(color: Colors.white)),
                  //           ),
                  //           ElevatedButton(
                  //             onPressed: () {
                  //               Navigator.of(context).pop();
                  //             },
                  //             style:  ButtonStyle(
                  //   backgroundColor: MaterialStateProperty.all(Colors.red),
                  //   padding: MaterialStateProperty.all(
                  //       EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
                  //   shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(27))),
                  // ),
                  //             child: const Text('Cancel', style: TextStyle(color: Colors.white)),
                  //           ),
                  //         ],
                  //       ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          child: Icon(Icons.arrow_forward_ios, color: iconColor),
        ),
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(imagePath),
        ),
        // onTap: () {
        //   print('onTap Pressed');
        // },
        // onLongPress: () {
        //   print('onLong Pressed!');
        // },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}