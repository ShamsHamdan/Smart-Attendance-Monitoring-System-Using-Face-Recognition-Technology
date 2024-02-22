import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/TabNavAddTeacherandCourse.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/add_course_form.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/editCourse.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list-student-in-course.dart';

//import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_courses_inSemester.dart';
import 'package:flutter/material.dart';

class ListofAddedCoursesForTeacher extends StatefulWidget {
  final String categoryId;
  const ListofAddedCoursesForTeacher({super.key, required this.categoryId});

  @override
  State<ListofAddedCoursesForTeacher> createState() =>
      _ListofAddedCoursesForTeacherState();
}

class _ListofAddedCoursesForTeacherState
    extends State<ListofAddedCoursesForTeacher> {
  List<QueryDocumentSnapshot> data = [];
  String? teacherId;
 bool isLoading = false;

  Future getData() async {
     setState(() {  isLoading = true;});
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(widget.categoryId)
        .collection('courses')
        .get();
    data.addAll(querySnapshot.docs);

    setState(() {  isLoading = false;});
  }

  Future getDataofTeacherId() async {
    DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(widget.categoryId)
        .get();
    teacherId = querySnapshot['id'];

    setState(() {});
  }

  @override
  void initState() {
    getData();
    getDataofTeacherId();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: kPrimaryColor,
        title: Text(
          'Courses',
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
                child: isLoading
                    ? Center(
                        child:
                            CircularProgressIndicator()) // Show loading indicator
                    : ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ListofAddedStudentForCourse(
                                            categoryId: data[i].id,
                                            teacherDocId: widget.categoryId)),
                              );
                            },
                            onLongPress: () {
                              AwesomeDialog(
                                context: context,
                                dialogType: DialogType.question,
                                animType: AnimType.rightSlide,
                                btnCancelOnPress: () {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.warning,
                                    animType: AnimType.rightSlide,
                                    btnCancelOnPress: () {},
                                    btnOkOnPress: () async {
                                      try {
                                        // await FirebaseFirestore.instance
                                        //     .collection('Teachers')
                                        //     .doc(widget.categoryId)
                                        //     .collection('courses')
                                        //     .doc(data[i].id)
      
                                        //     .delete();
      
                                        // Get a reference to the teacher document
                                        final teacherRef = FirebaseFirestore
                                            .instance
                                            .collection('Teachers')
                                            .doc(widget.categoryId);
      
                                        // Get a reference to the course document
                                        final courseRef = teacherRef
                                            .collection('courses')
                                            .doc(data[i].id);
      
                                        // Start a batch to perform atomic operations
                                        final batch = FirebaseFirestore
                                            .instance
                                            .batch();
      
                                        // Delete the course document
                                        batch.delete(courseRef);
      
                                        // Get a reference to the students subcollection of the course
                                        final studentsRef =
                                            courseRef.collection('students');
      
                                        // Get a reference to the attendance subcollection of the course
                                        final attendanceRef = courseRef
                                            .collection('attendance');
      
                                        // Check if the course has any students or attendance
                                        final studentsQuerySnapshot =
                                            await studentsRef.get();
                                        final attendanceQuerySnapshot =
                                            await attendanceRef.get();
      
                                        // If either students or attendance exist, delete them
                                        if (studentsQuerySnapshot
                                                .docs.isNotEmpty ||
                                            attendanceQuerySnapshot
                                                .docs.isNotEmpty) {
                                          // Delete all documents in the students subcollection
                                          for (final studentDoc
                                              in studentsQuerySnapshot.docs) {
                                            batch
                                                .delete(studentDoc.reference);
                                          }
      
                                          // Delete all documents in the attendance subcollection
                                          for (final attendanceDoc
                                              in attendanceQuerySnapshot
                                                  .docs) {
                                            batch.delete(
                                                attendanceDoc.reference);
                                          }
                                        }
      
                                        // Commit the batch operation
                                        await batch.commit();
      
                                        // Get a reference to the main Courses collection
                                        final mainCoursesRef =
                                            FirebaseFirestore.instance
                                                .collection('Courses');
      
                                        // Delete the course documents from the main Courses collection
                                        final mainCourseQuerySnapshot =
                                            await mainCoursesRef
                                                .where('idCourse',
                                                    isEqualTo: data[i]
                                                        ["idCourse"])
                                                .where('TeacherId',
                                                    isEqualTo: teacherId)
                                                .get();
      
                                        for (final mainCourseDoc
                                            in mainCourseQuerySnapshot.docs) {
                                          await mainCourseDoc.reference
                                              .delete();
                                        }
      
                                        // Get a reference to the main Students collection
                                        final mainStudentsRef =
                                            FirebaseFirestore.instance
                                                .collection('Students');
      
                                        // Delete the student documents from the main Students collection
                                        for (final studentDoc
                                            in studentsQuerySnapshot.docs) {
                                          final studentId =
                                              studentDoc["idStudent"];
                                          final mainStudentQuerySnapshot =
                                              await mainStudentsRef
                                                  .where('idStudent',
                                                      isEqualTo: studentId)
                                                  .get();
      
                                          for (final mainStudentDoc
                                              in mainStudentQuerySnapshot
                                                  .docs) {
                                            await mainStudentDoc.reference
                                                .delete();
                                          }
                                        }
      
      //  final teacherRef = FirebaseFirestore.instance.collection('Teachers').doc(widget.categoryId);
      
      //   // Get a reference to the course document
      //   final courseRef = teacherRef.collection('courses').doc(data[i].id);
      
      //   // Start a batch to perform atomic operations
      //   final batch = FirebaseFirestore.instance.batch();
      
      //   // Delete the course document
      //   batch.delete(courseRef);
      
      //   // Get a reference to the students subcollection of the course
      //   final studentsRef = courseRef.collection('students');
      
      //   // Get a reference to the attendance subcollection of the course
      //   final attendanceRef = courseRef.collection('attendance');
      
      //   // Check if the course has any students or attendance
      //   final studentsQuerySnapshot = await studentsRef.get();
      //   final attendanceQuerySnapshot = await attendanceRef.get();
      
      //   // If either students or attendance exist, delete them
      //   if (studentsQuerySnapshot.docs.isNotEmpty || attendanceQuerySnapshot.docs.isNotEmpty) {
      //     // Delete all documents in the students subcollection
      //     for (final studentDoc in studentsQuerySnapshot.docs) {
      //       batch.delete(studentDoc.reference);
      //     }
      
      //     // Delete all documents in the attendance subcollection
      //     for (final attendanceDoc in attendanceQuerySnapshot.docs) {
      //       batch.delete(attendanceDoc.reference);
      //     }
      //   }
      
      //   // Commit the batch operation
      //   await batch.commit();
      
      //                                     CollectionReference collectionRef =
      //                                         FirebaseFirestore.instance
      //                                             .collection('Courses');
      
      //                                     // Query the documents based on specific criteria using the 'where' clause
      //                                     QuerySnapshot querySnapshot =
      //                                         await collectionRef
      //                                             .where('idCourse',
      //                                                 isEqualTo:  data[i]['idCourse'])
      //                                             .where("TeacherId",
      //                                                 isEqualTo:teacherId)
      //                                             .get();
      
      //                                     for (QueryDocumentSnapshot docSnapshot
      //                                         in querySnapshot.docs) {
      //                                       await docSnapshot.reference.delete();
      //                                     }
      
                                        AwesomeDialog(
                                                context: context,
                                                dialogType:
                                                    DialogType.success,
                                                animType: AnimType.rightSlide,
                                                title: 'Success',
                                                titleTextStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize: 22),
                                                desc:
                                                    'Course deleted successfully.',
                                                descTextStyle:
                                                    TextStyle(fontSize: 17),
                                           buttonsTextStyle: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                      btnOkText: "Ok",
                                      btnOkOnPress: () {},
                                    ).show().then((value) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                             ListofAddedCoursesForTeacher(categoryId: widget.categoryId,)
                                        ),
                                      );
                                    });
                                      } catch (error) {
                                        AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.error,
                                                animType: AnimType.rightSlide,
                                                title: 'Failed',
                                                titleTextStyle: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize: 22),
                                                desc:
                                                    'Failed to delete course.',
                                                descTextStyle:
                                                    TextStyle(fontSize: 17))
                                            .show();
                                      }
                                    },
                                    btnOkText: "Delete",
                                      btnOkColor: Colors.red,
                                btnCancelColor: Colors.green,
                                    buttonsTextStyle: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    btnCancelText: "Cancel",
                                    title:
                                        'Are you sure of deleting process?',
                                    titleTextStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ).show();
                                },
                                btnOkOnPress: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditCourseFormPage(
                                              courseId: data[i].id,
                                              docId: widget.categoryId,
                                            )),
                                  );
                                },
                                btnOkText: "Update",
                                buttonsTextStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                btnCancelText: "Delete",
                                title: 'Choose Action',
                                titleTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ).show();
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AddCourseFormPage(
                      docId: widget.categoryId,
                    )),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
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
                color: textColor, fontSize: 19, fontWeight: FontWeight.bold)),
        subtitle:
            Text(subtitle, style: TextStyle(color: textColor, fontSize: 17)),
        trailing: GestureDetector(
          // onTap: () {
          // Show dialog here
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
      
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
