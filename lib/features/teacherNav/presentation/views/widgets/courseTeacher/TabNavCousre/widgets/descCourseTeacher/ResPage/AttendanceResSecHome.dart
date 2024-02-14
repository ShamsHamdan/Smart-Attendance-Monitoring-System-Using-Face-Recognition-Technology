import 'package:first_version/constants.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ResAtt extends StatefulWidget {
  final String courseId;

  const ResAtt({Key? key, required this.courseId}) : super(key: key);

  @override
  State<ResAtt> createState() => _ResAttState();
}

class _ResAttState extends State<ResAtt> {
  bool _isDataAvailable = false; // Track if new data is available
  bool _hasDialogShown = false; // Track if the dialog has been shown
 dynamic _previousDataSnapshot;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            "Recent Attendance Session ",
            style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: ElevatedButton(
            onPressed: _isDataAvailable
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            StudentAttendancePage(courseId: widget.courseId),
                            
                      ),
                    );








                    
                  }
                : null, // Disable the button if there's no new data
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 140),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              primary: _isDataAvailable ? kPrimaryColor : Colors.grey, // Set button color
            ),
            child: Text(
              "Results",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: _isDataAvailable ? Colors.white : Colors.grey, // Set text color
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    initializeFirebase();
    listenToDataChanges();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
  }
 void listenToDataChanges() {
    DatabaseReference _databaseReference =
        FirebaseDatabase.instance.ref().child('attendance');

    _databaseReference.onValue.listen((event) {
      var data = event.snapshot.value;
      
      if (data != null && data is Map<dynamic, dynamic>) {
        // Check if the new data is different from the previous one
        if (!mapEquals(data, _previousDataSnapshot)) {
          setState(() {
            _isDataAvailable = true;
            _previousDataSnapshot = data;
          });
          showDataArrivedDialog(); // Show the dialog when new data arrives
        }
      } else {
        // No new data
        if (_isDataAvailable) {
          // Reset _hasDialogShown only if it was previously set
          setState(() {
            _isDataAvailable = false;
          });
        }
      }
    });
  }



  void showDataArrivedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("New Data Arrived"),
          content: Text("New attendance data is available. You can now view the results."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }
}




// import 'package:first_version/constants.dart';
// import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/test.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class ResAtt extends StatefulWidget {
//   final String courseId;

//   const ResAtt({Key? key, required this.courseId}) : super(key: key);

//   @override
//   State<ResAtt> createState() => _ResAttState();
// }

// class _ResAttState extends State<ResAtt> {
//   bool _isDataAvailable = false; // Track if new data is available

//   @override
//   Widget build(BuildContext context) {
//     return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
//       Align(
//         alignment: Alignment.topLeft,
//         child: Text("Recent Attendance Session ",
//             style: TextStyle(
//                 color: Color.fromARGB(255, 0, 0, 0),
//                 fontSize: 25,
//                 fontWeight: FontWeight.bold)),
//       ),
//       SizedBox(
//         height: 20,
//       ),
//       Center(
//         child: ElevatedButton(
//           // style: ElevatedButton.styleFrom(
//           //     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
//           //     shape: RoundedRectangleBorder(
//           //       borderRadius: BorderRadius.circular(20),
//           //     ),
//           //   ),
//           onPressed: _isDataAvailable
//               ? () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           StudentAttendancePage(courseId: widget.courseId),
//                     ),
//                   );
//                 }
//               : null, // Disable the button if there's no new data
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.symmetric(vertical: 15, horizontal: 140),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           child: Text(
//             "Results",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//               color: Colors.white,
//             ),
//           ),
//           //  Container(
//           //       width: MediaQuery.of(context).size.width * .95,
//           //       height: 60,
//           //       margin: const EdgeInsets.only(bottom: 45),
//           //       decoration: BoxDecoration(
//           //           color: kPrimaryColor,
//           //           borderRadius: BorderRadius.circular(20)),
//           //       child: const Center(
//           //           child: Row(
//           //         mainAxisAlignment: MainAxisAlignment.center,
//           //         children: [
//           //           // Icon(Icons.camera_enhance,color: Colors.white,),
//           //           // SizedBox(width: 5,),
//           //           Text(
//           //             "Results",
//           //             style: TextStyle(
//           //                 fontSize: 23,
//           //                 fontWeight: FontWeight.w600,
//           //                 color: Colors.white),
//           //           ),
//           //         ],
//           //       )),
//           //     ))
//         ),
//       )
//     ]);
//   }

//   @override
//   void initState() {
//     super.initState();
//     initializeFirebase();
//     listenToDataChanges();
//   }

//   Future<void> initializeFirebase() async {
//     await Firebase.initializeApp();
//   }

//   void listenToDataChanges() {
//     DatabaseReference _databaseReference =
//         FirebaseDatabase.instance.ref().child('attendance');

//     _databaseReference.onValue.listen((event) {
//       var data = event.snapshot.value;
//       if (data != null && data is Map<dynamic, dynamic>) {
//         // Check if there's new data
//         if (!_isDataAvailable) {
//           // If there wasn't data before, set _isDataAvailable to true
//           setState(() {
//             _isDataAvailable = true;
//           });
//           showDataArrivedDialog(); // Show the dialog when new data arrives
//         }
//       }
//     });
//   }

//   void showDataArrivedDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text("New Data Arrived"),
//           content: Text(
//               "New attendance data is available. You can now view the results."),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close the dialog
//               },
//               child: Text("OK"),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }




// import 'package:first_version/constants.dart';
// import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/ReslutBodyOfAttendans.dart';
// import 'package:flutter/material.dart';

// class ResAtt extends StatefulWidget {
//   final String courseId;
//   const ResAtt({super.key, required this.courseId});

//   @override
//   State<ResAtt> createState() => _ResAttState();
// }

// class _ResAttState extends State<ResAtt> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: [
//         Align(
//           alignment: Alignment.topLeft,
//           child: Text("Recent Attendance Session ",
//               style: TextStyle(
//                   color: Color.fromARGB(255, 0, 0, 0),
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold)),
//         ),
//         SizedBox(
//           height: 20,
//         ),
//         Center(
//             child: GestureDetector(
//                 onTap: () {
//                    Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ReslutOfAttendans(courseId:widget.courseId)
//             ));
//                 },
//                 child: Container(
//                   width: MediaQuery.of(context).size.width * .95,
//                   height: 60,
//                   margin: const EdgeInsets.only(bottom: 45),
//                   decoration: BoxDecoration(
//                       color: kPrimaryColor,
//                       borderRadius: BorderRadius.circular(20)),
//                   child: const Center(
//                       child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       // Icon(Icons.camera_enhance,color: Colors.white,),
//                       // SizedBox(width: 5,),
//                       Text(
//                         "Results",
//                         style: TextStyle(
//                             fontSize: 23,
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white),
//                       ),
//                     ],
//                   )),
//                 ))),
//       ],
//     );
//   }
// }
