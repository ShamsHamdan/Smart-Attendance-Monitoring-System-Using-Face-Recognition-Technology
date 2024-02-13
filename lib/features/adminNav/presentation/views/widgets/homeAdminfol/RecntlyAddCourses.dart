import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_added_courses.dart';
import 'package:flutter/material.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecentlyAddCourses extends StatefulWidget {
  const RecentlyAddCourses({super.key});

  @override
  _RecentlyAddCoursesState createState() => _RecentlyAddCoursesState();
}

class _RecentlyAddCoursesState extends State<RecentlyAddCourses> {
  List<QueryDocumentSnapshot> coursesData = [];
 bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async {
     setState(() {
       isLoading = true;
    });
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Courses')
        .where("Admin", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        // .orderBy('createdAt', descending: true)
        // .limit(2)
        .get();
    setState(() {
      coursesData = querySnapshot.docs;
        isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              "Recently added courses",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Align(
           alignment: coursesData.length == 1 ? Alignment.centerLeft : Alignment.center,
          child:isLoading
            ? CircularProgressIndicator() // Show loading indicator
            :
           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: coursesData.map((courseDoc) {
                final imageUrl = courseDoc['url'];
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 300,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 0),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: double.infinity,
                              height: 110,
                              child: imageUrl.isNotEmpty
                                    ? Image.network(
                                        imageUrl,
                                        fit: BoxFit.cover,
                                        scale: 1.0,
                                      )
                                    : Image.asset(
                                        AssetsData.webcourse, // Default image asset
                                        fit: BoxFit.cover,
                                      ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 107,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      courseDoc['name'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                    "EIT",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      courseDoc['idCourse'],
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}




// class RecntlyAddCourses extends StatelessWidget {
//   const RecntlyAddCourses({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Row(
//         children: [
//           SizedBox(
//             width: 20,
//           ),
//           Text("Recently added courses",
//               style: TextStyle(
//                   color: Color.fromARGB(255, 0, 0, 0),
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold)),
//           // SizedBox(
//           //   width: 90,
//           // ),
//           //  GestureDetector(
//           //   onTap: () {
//           //       Navigator.push(context, MaterialPageRoute(builder: (context) => ListofAddedCourses()));
//           //       //Navigator.pushNamed(context, "/maintabcoursesinteacher");
//           //   },
//           //   child: Text("see all",
//           //       style: TextStyle(
//           //           color: Color.fromARGB(255, 149, 149, 149), fontSize: 19)),
//           // )
//           // Text("see all",
//           //     style: TextStyle(
//           //         color: Color.fromARGB(255, 149, 149, 149), fontSize: 19))
//         ],
//       ),
//       SizedBox(
//         height: 30,
//       ),
//       SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(children: <Widget>[
//             SizedBox(
//               width: 20,
//             ),
//             Container(
//                 width: 300,
//                 margin: EdgeInsets.only(bottom: 15),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.white,
//                       offset: Offset(0, 0),
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Material(
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                                SizedBox(
//                           width: double.infinity,
//                           height: 100, // Set the desired height
//                           child:
//                           Image.asset(
//                             AssetsData.webcourse,
//                             fit: BoxFit.cover,
//                             //  width: double.infinity,
//                           ),),
//                          SizedBox(
//                              width: double.infinity,
//                              height: 107, 
//                         child:  Container(
//                             padding: EdgeInsets.all(15),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "INTERNSHIP Section1",
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 // Padding(
//                                 //   padding: EdgeInsets.only(top: 5),
//                                 // ), 
//                                 Text(
//                                   'EIT',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold
//                                   ),
//                                 ),
//                                 Text(
//                                   '230214990',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
                               
//                               ],
//                             ),
//                           ),),
//                         ])
//                         )
//                         )
//                         ),
//             SizedBox(
//               width: 30,
//             ),
//             Container(
//                 width: 300,
//                 margin: EdgeInsets.only(bottom: 15),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.white,
//                       offset: Offset(0, 0),
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Material(
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                                SizedBox(
//                           width: double.infinity,
//                           height: 100, // Set the desired height
//                           child:
//                           Image.asset(
//                             AssetsData.webcourse,
//                             fit: BoxFit.cover,
//                             //  width: double.infinity,
//                           ),),
//                          SizedBox(
//                              width: double.infinity,
//                              height: 107, 
//                         child:  Container(
//                             padding: EdgeInsets.all(15),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: <Widget>[
//                                 Text(
//                                   "INTERNSHIP Section1",
//                                   style: TextStyle(
//                                     fontSize: 20,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 // Padding(
//                                 //   padding: EdgeInsets.only(top: 5),
//                                 // ), 
//                                 Text(
//                                   'EIT',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold
//                                   ),
//                                 ),
//                                 Text(
//                                   '230214990',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.grey,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),),
//                         ])
//                         )
//                         )
//                         ),
//           ]))
//     ]);
//   }
// }
