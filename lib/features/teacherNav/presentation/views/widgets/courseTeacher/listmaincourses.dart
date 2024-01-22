import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/CourseInTeacherTabNav.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ListCoursestest extends StatefulWidget {
  // const ListCoursestest({super.key});
  const ListCoursestest({Key? key}) : super(key: key);
  @override
  State<ListCoursestest> createState() => _ListCoursestestState();
}

class _ListCoursestestState extends State<ListCoursestest> {
  List<QueryDocumentSnapshot> data = [];

  List<QueryDocumentSnapshot> dataOfCourses = [];
  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    data.addAll(querySnapshot.docs);
    String docId = data[0].id;

    QuerySnapshot querySnapshott = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .get();

    dataOfCourses.addAll(querySnapshott.docs);

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
    double attendancePercentage = .75;
    bool isLowAttendance = attendancePercentage <= 0.5;
    bool showSearchField = false;

    return Container(
      // color: Colors.amber,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("My Courses",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 26,
                        fontWeight: FontWeight.bold)),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      // showSearchField = true; // Set showSearchField to true
                    });
                  },
                ),
                // if (showSearchField)
                //   Padding(
                //     padding: const EdgeInsets.symmetric(horizontal: 16),
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: TextField(
                //             decoration: InputDecoration(
                //               hintText: 'Search for a course...',
                //             ),
                //           ),
                //         ),
                //         IconButton(
                //           icon: Icon(Icons.cancel, color: Colors.black),
                //           onPressed: () {
                //             setState(() {
                //               showSearchField = false;
                //             });
                //           },
                //         ),
                //       ],
                //     ),
                //   ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: dataOfCourses.length,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CourseInTeacherTabNav(
                              courseId: dataOfCourses[i].id)),
                    );
                  },
                  child: courseCont(
                    dataOfCourses[i]["name"],
                    dataOfCourses[i]["idCourse"],
                    dataOfCourses[i]["url"],
                    dataOfCourses[i]["section"],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 20,
                );
              },
            ),
          )
        ]),
      ),
    );
  }

  Widget courseCont(String name, String id, String url, String sec) {
    double attendancePercentage = .75;
    bool isLowAttendance = attendancePercentage <= 0.5;
    bool showSearchField = false;

    return Container(
        width: 380,
        margin: const EdgeInsets.only(bottom: 15),
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
                    height: 130, // Set the desired height
                    child: url != null && url!.isNotEmpty
                        ? Image.network(
                            Uri.parse(url!).toString(),
                            fit: BoxFit.cover,
                          )
                        : Image.asset(AssetsData.imageAddCourseDef),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 110,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "$name section$sec",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                              ),
                              Text(
                                'EIT',
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                id,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: CircularPercentIndicator(
                              radius: 24.0,
                              lineWidth: 5.0,
                              percent:
                                  0.75, // Change this to your actual percentage
                              center: Text(
                                "${(attendancePercentage * 100).toInt()}%",
                                style: TextStyle(
                                  color: isLowAttendance
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ), // Change this to your actual text
                              progressColor:
                                  isLowAttendance ? Colors.red : Colors.green,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]))));
  }
}





  // Container(
  //                   width: 380,
  //                   margin: const EdgeInsets.only(bottom: 15),
  //                   decoration: BoxDecoration(
  //                     borderRadius: BorderRadius.circular(10),
  //                     boxShadow: [
  //                       BoxShadow(
  //                         color: Colors.white,
  //                         offset: Offset(0, 0),
  //                         blurRadius: 5,
  //                       ),
  //                     ],
  //                   ),
  //                   child: ClipRRect(
  //                       borderRadius: BorderRadius.circular(10),
  //                       child: Material(
  //                           child: Column(
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: <Widget>[
  //                             SizedBox(
  //                               width: double.infinity,
  //                               height: 130, // Set the desired height
  //                               child: Image.asset(
  //                                 AssetsData.webcourse,
  //                                 fit: BoxFit.cover,
  //                                 //  width: double.infinity,
  //                               ),
  //                             ),
  //                             SizedBox(
  //                               width: double.infinity,
  //                               height: 110,
  //                               child: Container(
  //                                 padding: EdgeInsets.all(15),
  //                                 child: Stack(
  //                                   children: [
  //                                     const Column(
  //                                       crossAxisAlignment:
  //                                           CrossAxisAlignment.start,
  //                                       children: <Widget>[
  //                                         Text(
  //                                           "INTERNSHIP Section1",
  //                                           style: TextStyle(
  //                                             fontSize: 19,
  //                                             color: Colors.black,
  //                                             fontWeight: FontWeight.bold,
  //                                           ),
  //                                         ),
  //                                         Padding(
  //                                           padding: EdgeInsets.only(top: 5),
  //                                         ),
  //                                         Text(
  //                                           'EIT',
  //                                           style: TextStyle(
  //                                               fontSize: 17,
  //                                               color: Colors.black,
  //                                               fontWeight: FontWeight.bold),
  //                                         ),
  //                                         Text(
  //                                           '230214990',
  //                                           style: TextStyle(
  //                                             fontSize: 17,
  //                                             color: Colors.grey,
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     Positioned(
  //                                       right: 0,
  //                                       top: 0,
  //                                       child: CircularPercentIndicator(
  //                                         radius: 24.0,
  //                                         lineWidth: 5.0,
  //                                         percent:
  //                                             0.75, // Change this to your actual percentage
  //                                         center: Text(
  //                                           "${(attendancePercentage * 100).toInt()}%",
  //                                           style: TextStyle(
  //                                             color: isLowAttendance
  //                                                 ? Colors.red
  //                                                 : Colors.green,
  //                                           ),
  //                                         ), // Change this to your actual text
  //                                         progressColor: isLowAttendance
  //                                             ? Colors.red
  //                                             : Colors.green,
  //                                       ),
  //                                     ),
  //                                   ],
  //                                 ),
  //                               ),
  //                             ),
  //                           ])))),