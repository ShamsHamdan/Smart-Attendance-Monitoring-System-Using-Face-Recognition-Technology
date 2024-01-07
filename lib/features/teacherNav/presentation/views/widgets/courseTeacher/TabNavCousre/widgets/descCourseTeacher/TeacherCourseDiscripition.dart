import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/image_header.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/decrBody.dart';
import 'package:flutter/material.dart';

//import 'bar_chart.dart';

class TeacherCourseDiscripition extends StatefulWidget {
  final String courseId;
  const TeacherCourseDiscripition({super.key, required this.courseId});

  @override
  State<TeacherCourseDiscripition> createState() =>
      _TeacherCourseDiscripitionState();
}

class _TeacherCourseDiscripitionState extends State<TeacherCourseDiscripition> {
  List<QueryDocumentSnapshot> data = [];
  String? url;
  //List<QueryDocumentSnapshot> dataOfCourses = [];
  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    data.addAll(querySnapshot.docs);
    String docId = data[0].id;

    DocumentSnapshot querySnapshott = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .doc(widget.courseId)
        .get();

    DocumentSnapshot dataofcourse = querySnapshott;
     url = dataofcourse["url"];

    setState(() {
      // print("${data[0]['name']}");
      // Adminemail = data['email'];
      // Adminpass = data['password'];
    });
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
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Container(
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    //  height: 300,
                    child: ImageHeader(imgSrc: url ?? ''),
                  )),
              Positioned(
                  top: 190,
                  bottom: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                    child: CourseInfo(
                      courseId: widget.courseId,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
    
    
    
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Scaffold(
    //   body: SafeArea(
    //     child: SingleChildScrollView(
    //       child: Stack(
    //         children: [
    //           Column(
    //             children: [
    //               Container(
    //                 width: double.infinity,
    //                 height: 240,
    //                 decoration: BoxDecoration(
    //                   color: Color(0xff369893),
    //                   borderRadius: BorderRadius.only(
    //                     bottomLeft: Radius.circular(20),
    //                     bottomRight: Radius.circular(20),
    //                   ),
    //                 ),
    //                 child: Stack(
    //                   children: [
    //                     Positioned(
    //                       top: 35,
    //                       left: 950,
    //                       child: ClipRRect(
    //                         borderRadius: BorderRadius.circular(7),
    //                         child: Container(
    //                           height: 40,
    //                           width: 40,
    //                           color: Colors.white,
    //                           child: Text(
    //                             "15",
    //                             style: TextStyle(
    //                               color: Color(0xff369893),
    //                               fontSize: 30,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     Padding(
    //                       padding: const EdgeInsets.only(top: 35, left: 10),
    //                       child: Column(
    //                         crossAxisAlignment: CrossAxisAlignment.start,
    //                         children: [
    //                           Text(
    //                             'MACHINE LEARNING',
    //                             style: TextStyle(
    //                               fontWeight: FontWeight.w600,
    //                               fontSize: 20,
    //                               color: Colors.white,
    //                             ),
    //                           ),
    //                           Text(
    //                             'Section1',
    //                             style: TextStyle(
    //                               fontWeight: FontWeight.w600,
    //                               fontSize: 16,
    //                               color: Color.fromARGB(255, 224, 223, 223),
    //                             ),
    //                           ),
    //                           Text(
    //                             'Dr.Mohammed Awad ',
    //                             style: TextStyle(
    //                               fontWeight: FontWeight.w600,
    //                               fontSize: 20,
    //                               color: Colors.white,
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),

    //               // Students' Cards
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
    //                 child: ElevatedButton(
    //                   onPressed: () {
    //                     // Handle button press
    //                   },
    //                   style: ElevatedButton.styleFrom(
    //                     primary: Color.fromARGB(255, 47, 125, 121),
    //                   ),
    //                   child: Text(
    //                     'Take Attendance',
    //                     style: TextStyle(color: Colors.white),
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
    //                 child: Card(
    //                   child: Padding(
    //                     padding: const EdgeInsets.symmetric(
    //                         vertical: 10, horizontal: 20),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Text('Amal Otifat', style: TextStyle(fontSize: 16)),
    //                         Icon(Icons.close, color: Color(0xff369893)),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
    //                 child: Card(
    //                   child: Padding(
    //                     padding: const EdgeInsets.symmetric(
    //                         vertical: 10, horizontal: 20),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Text('Shams Abu Hazeem', style: TextStyle(fontSize: 16)),
    //                         Icon(Icons.check, color: Color(0xff369893)),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
    //                 child: Card(
    //                   child: Padding(
    //                     padding: const EdgeInsets.symmetric(
    //                         vertical: 10, horizontal: 20),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Text('Qosay Abu Alrob', style: TextStyle(fontSize: 16)),
    //                         Icon(Icons.check, color: Color(0xff369893)),
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               ),
    //               Padding(
    //                 padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
    //                 child: Container(
    //                   height: 150,
    //                   margin: const EdgeInsets.only(top: 10),
    //                   child: Padding(
    //                     padding: const EdgeInsets.only(left: 20, right: 20),
    //                   //  child: ChartPage(),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),

    //           // Chart under the List of Cards
    //           Positioned(
    //             top: 140,
    //             left: 50,
    //             child: Container(
    //               height: 170,
    //               width: 320,
    //               decoration: BoxDecoration(
    //                 color: Color.fromARGB(255, 47, 125, 121),
    //                 borderRadius: BorderRadius.circular(15),
    //               ),
    //               child: Padding(
    //                 padding: const EdgeInsets.only(left: 15),
    //                 child: Column(
    //                   children: [
    //                     Text(
    //                       'Days[Monday,Wednesday] ',
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.w600,
    //                         fontSize: 16,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                     SizedBox(height: 9),
    //                     Text(
    //                       'Time[10:00-11:15] ',
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.w600,
    //                         fontSize: 16,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                     SizedBox(height: 9),
    //                     Text(
    //                       'Building:-(Engineering and Information Te) ',
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.w600,
    //                         fontSize: 16,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                     Text(
    //                       'Room:-(010)  ',
    //                       style: TextStyle(
    //                         fontWeight: FontWeight.w600,
    //                         fontSize: 16,
    //                         color: Colors.white,
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // )