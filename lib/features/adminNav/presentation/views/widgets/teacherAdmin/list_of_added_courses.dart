import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/add_course_form.dart';

//import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_courses_inSemester.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/student-course-main.dart';
import 'package:flutter/material.dart';

class ListofAddedCourses extends StatefulWidget {
  const ListofAddedCourses({super.key});

  @override
  State<ListofAddedCourses> createState() => _ListofAddedCoursesState();
}

class _ListofAddedCoursesState extends State<ListofAddedCourses> {
  List<QueryDocumentSnapshot> data = [];
  // String? depInDai;
  // String? faculty;
  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Courses')
        .where("Admin", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);

    setState(() {});
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'List of added Courses',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                       String faculty = "";
                String depInDai = "";
                     
                if (data[i]["faculty"] == "Faculty of Engineering and Information Technology") {
                  faculty = "EIT";
                  print("$faculty");
                } else {
                  faculty = data[i]["faculty"];
                }

                if (data[i]["department"] == "Computer systems engineering Department") {
                  depInDai = "CSE";
                }
                      return InkWell(
                        onLongPress: () {
                          _showAttendanceDialog(
                              context,
                              data[i]["TeacherName"],
                              faculty ,
                              depInDai );
                          //             showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return Dialog(
                          //       shape: RoundedRectangleBorder(
                          //         borderRadius: BorderRadius.circular(20),
                          //       ),
                          //       child: SizedBox(
                          //         height: 200,
                          //         child: Column(
                          //           mainAxisAlignment: MainAxisAlignment.center,
                          //           children: [
                          //              Text('Teacher: Mohammad Awad',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          //             SizedBox(height: 10,),
                          //            Text('Faculty:EIT',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                          //             SizedBox(height: 10,),
                          //             Text('Department:CSE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),

                          //           ],
                          //         ),
                          //       ),
                          //     );
                          //   },
                          // );
                        },
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ListofAddedStudentForCourseMain(
                                        categoryId: data[i].id)),
                          );
                        },
                        child: buildCourseContainer(
                            data[i]["name"],
                            data[i]["idCourse"],
                            Colors.white,
                            kPrimaryColor,
                            data[i]["url"],
                            kPrimaryColor,
                            context),
                      );
                    })),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: kPrimaryColor,
      //   onPressed: () {

      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => MyApp()),
      //     );
      //   },
      //   child: Icon(Icons.add,color: Colors.white,),
      // ),
    );
  }

  Widget buildCourseContainer(
      String name,
      String subtitle,
      Color containerColor,
      Color textColor,
      String imagePath,
      Color iconColor,
      BuildContext context) {
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
        title: Text(name,
            style: TextStyle(
                color: textColor, fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle:
            Text(subtitle, style: TextStyle(color: textColor, fontSize: 17)),
        trailing: GestureDetector(
          // onLongPress: () {
          //   // Show dialog here
          //   showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return Dialog(
          //         shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(20),
          //         ),
          //         child: SizedBox(
          //           height: 200,
          //           child: Column(
          //             mainAxisAlignment: MainAxisAlignment.center,
          //             children: [
          //               const Text(
          //                 'Teacher: Mohammad Awad',
          //                 style: TextStyle(
          //                     fontSize: 20, fontWeight: FontWeight.bold),
          //               ),
          //               SizedBox(
          //                 height: 10,
          //               ),
          //               const Text('Faculty:EIT',
          //                   style: TextStyle(
          //                       fontSize: 20, fontWeight: FontWeight.bold)),
          //               SizedBox(
          //                 height: 10,
          //               ),
          //               const Text('Department:CSE',
          //                   style: TextStyle(
          //                       fontSize: 20, fontWeight: FontWeight.bold)),

          //               //       const SizedBox(height: 20),
          //               //       Row(
          //               //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //               //         children: [
          //               //           ElevatedButton(
          //               //             onPressed: () {
          //               //               // Handle Add button press

          //               //               Navigator.of(context).pop();
          //               //             },
          //               //             style:  ButtonStyle(
          //               //   backgroundColor: MaterialStateProperty.all(kPrimaryColor),
          //               //   padding: MaterialStateProperty.all(
          //               //       EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
          //               //   shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //               //       borderRadius: BorderRadius.circular(27))),
          //               // ),
          //               //             child: const Text('Add', style: TextStyle(color: Colors.white)),
          //               //           ),
          //               //           ElevatedButton(
          //               //             onPressed: () {
          //               //               Navigator.of(context).pop();
          //               //             },
          //               //             style:  ButtonStyle(
          //               //   backgroundColor: MaterialStateProperty.all(Colors.red),
          //               //   padding: MaterialStateProperty.all(
          //               //       EdgeInsets.symmetric(horizontal: 40, vertical: 10)),
          //               //   shape: MaterialStateProperty.all(RoundedRectangleBorder(
          //               //       borderRadius: BorderRadius.circular(27))),
          //               // ),
          //               //             child: const Text('Cancel', style: TextStyle(color: Colors.white)),
          //               //           ),
          //               //         ],
          //               //       ),
          //             ],
          //           ),
          //         ),
          //       );
          //     },
          //   );
          // },
          child: Icon(Icons.arrow_forward_ios, color: iconColor),
        ),
        leading: CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          backgroundImage: imagePath != null && imagePath!.isNotEmpty
              ? NetworkImage(Uri.parse(imagePath!).toString())
              : AssetImage(AssetsData.imageAddCourseDef)
                  as ImageProvider<Object>,
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

  void _showAttendanceDialog(
      BuildContext context, String name, String faculty, String dep) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Course Details:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Teacher:$name',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Faculty:$faculty',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Department:$dep',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  onPrimary: Colors.white,
                ),
                child: Text(
                  'OK',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        );
      },
    );
  }
}
