import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/add-student-form.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/add_course_form.dart';

//import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_courses_inSemester.dart';
import 'package:flutter/material.dart';

class ListofAddedStudentForCourseMain extends StatefulWidget {
  final String categoryId;

  const ListofAddedStudentForCourseMain({super.key, required this.categoryId});

  @override
  State<ListofAddedStudentForCourseMain> createState() =>
      _ListofAddedStudentForCourseMainState();
}

class _ListofAddedStudentForCourseMainState
    extends State<ListofAddedStudentForCourseMain> {
  List<QueryDocumentSnapshot> data = [];
  String? idofthisCourse;

  Future getDataofCourse() async {
    DocumentSnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Courses')
        .doc(widget.categoryId)
        .get();
    String data = querySnapshot.get('idCourse');

    idofthisCourse = data;

    setState(() {
      print("$idofthisCourse");
    });
  }
Future<void> getData() async {
  if (idofthisCourse != null) {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Students')
        .where('idCourse', isEqualTo: idofthisCourse)
        .get();
    data.addAll(querySnapshot.docs);

    setState(() {
      print("$data");
    });
  }
}

@override
void initState() {
  super.initState();
  getDataofCourse().then((_) {
    getData();
  });
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
          'Students',
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
                      return InkWell(
                        onTap: () {
                          //              Navigator.push(
                          //   context,
                          //   MaterialPageRoute(builder: (context) => ListofAddedCoursesForTeacher(categoryId:data[i].id)),
                          // );
                        },
                        child: buildCourseContainer(
                            data[i]["name"],
                            data[i]["idStudent"],
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
