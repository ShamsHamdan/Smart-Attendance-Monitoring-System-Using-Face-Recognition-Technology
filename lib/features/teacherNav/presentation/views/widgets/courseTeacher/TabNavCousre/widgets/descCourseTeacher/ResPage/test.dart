import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/TabNavCousre/widgets/descCourseTeacher/ResPage/Res_Body_Header.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentAttendancePage extends StatefulWidget {
  final String courseId;

  const StudentAttendancePage({Key? key, required this.courseId})
      : super(key: key);
  @override
  // State< StudentAttendancePage> createState() => _StudentAttendancePageState();
  _StudentAttendancePageState createState() => _StudentAttendancePageState();
}

class _StudentAttendancePageState extends State<StudentAttendancePage> {
  late DatabaseReference _databaseReference;
  List<dynamic> _attendanceData = [];
  // List<Map<String, dynamic>> _attendanceData = [];
  List<Map<String, dynamic>> _studentData = [];
  List<Map<String, dynamic>> _displayedData = [];
  String _selectedOption = 'All';
  List<QueryDocumentSnapshot> data = [];
  List<QueryDocumentSnapshot> dataOfStudent = [];
  int? numofstudent;
  bool _isLoading = false;

  Future<void> getData() async {
    setState(() {
      _isLoading = true;
    });

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    data.addAll(querySnapshot.docs);
    String docId = data[0].id;

    QuerySnapshot querySnapshotStu = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .doc(widget.courseId)
        .collection('students')
        .get();

    dataOfStudent.addAll(querySnapshotStu.docs);
    numofstudent = dataOfStudent.length;

    setState(() {
      _studentData = List<Map<String, dynamic>>.from(
        querySnapshotStu.docs
            .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
            .toList(),
      );
      _updateDisplayedData();
      _isLoading = false;
      print('=========================================$_studentData');
    });
  }

  @override
  void initState() {
    super.initState();

    Firebase.initializeApp().then((value) {
      setState(() {
        _databaseReference =
            FirebaseDatabase.instance.ref().child('attendance');
      });

      _databaseReference.onValue.listen((event) {
        var data = event.snapshot.value;
        if (data != null && data is Map<dynamic, dynamic>) {
          setState(() {
            _attendanceData =
                data.values.toList(); // Adjust the conversion if needed
            getData();
            _updateDisplayedData();
            print('=========================================$_attendanceData');
          });
        }
      });
    });
  }

  void _updateDisplayedData() {
    _displayedData = [];
    if (_selectedOption == 'All') {
      for (var student in _studentData) {
        String studentId = student['idStudent'];
        String studentName = student['name'];
        String profilePictureUrl = student['url'];
        bool isAttending = _isStudentAttending(studentName);
        _displayedData.add({
          'name': studentName,
          'profile_picture_url': profilePictureUrl,
          'is_attending': isAttending,
        });
      }
    } else if (_selectedOption == 'Attending') {
      for (var student in _studentData) {
        String studentId = student['idStudent'];
        String studentName = student['name'];
        String profilePictureUrl = student['url'];
        bool isAttending = _isStudentAttending(studentName);
        if (isAttending) {
          _displayedData.add({
            'name': studentName,
            'profile_picture_url': profilePictureUrl,
            'is_attending': isAttending,
          });
        }
      }
    } else if (_selectedOption == 'Absent') {
      for (var student in _studentData) {
        String studentId = student['idStudent'];
        String studentName = student['name'];
        String profilePictureUrl = student['url'];
        bool isAttending = _isStudentAttending(studentName);
        if (!isAttending) {
          _displayedData.add({
            'name': studentName,
            'profile_picture_url': profilePictureUrl,
            'is_attending': isAttending,
          });
        }
      }
    }
  }

  bool _isStudentAttending(String studentName) {
    String uppercaseName = studentName.toUpperCase().trim();
    for (var attendance in _attendanceData) {
      print('bbbbbbb$attendance');
      String nameInAttendance =
          attendance['name'].toString().toUpperCase().trim();
      print('Attendance name: $nameInAttendance');
      print('Student name: $uppercaseName');
      if (nameInAttendance == uppercaseName) {
        var isAttending = true;
        if (isAttending != null && isAttending is bool) {
          return isAttending;
        }
        break;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
             SizedBox(
            height: 270,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 210,
                  decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                ),
                const Positioned(
                  top: 0,
                  left: 155,
                  child: Text('Results',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white)),
                ),
                Positioned(
                  top: 90,
                  left: 20,
                  right: 20,
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 5.0)),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 25,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Icon(
                              Icons.person,
                              size: 37,
                              color: kPrimaryColor,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
  _studentData.length.toString(),
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),

                            // Text(
                            //   "15",
                            //   style: TextStyle(
                            //       fontSize: 20, fontWeight: FontWeight.bold),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "All",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 55,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Icon(
                              Icons.check,
                              size: 37,
                              color: Colors.green,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
  _displayedData
      .where((student) => student['is_attending'])
      .length
      .toString(),
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Attendess",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            // Text(
                            //   "X",
                            //   style: TextStyle(
                            //       fontSize: 30,
                            //       color: Colors.red,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            Icon(
                              Icons.close,
                              size: 37,
                              color: Colors.red,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                           Text(
  _displayedData
      .where((student) => !student['is_attending'])
      .length
      .toString(),
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Absentees",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
           // ResBodyHeader(),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                 padding: EdgeInsets.only(left: 20.0),
                child: Container(
                   width: MediaQuery.of(context).size.width * 0.4, // Adjust the width as needed
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                  child: DropdownButtonFormField<String>(
                    value: _selectedOption,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedOption = newValue!;
                        _updateDisplayedData();
                      });
                    },
                    items: <DropdownMenuItem<String>>[
                      DropdownMenuItem<String>(
                        value: 'All',
                        child: Text('All'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Attending',
                        child: Text('Attending'),
                      ),
                      DropdownMenuItem<String>(
                        value: 'Absent',
                        child: Text('Absent'),
                      ),
                    ],
                     decoration: InputDecoration(
                            border: InputBorder.none, // Remove the border from the input decoration
                            contentPadding: EdgeInsets.symmetric(horizontal: 10.0), // Adjust the content padding as needed
                          ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            //  Text('shams'),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView.builder(
                      
                       // shrinkWrap: true,
                        itemCount: _displayedData.length,
                        itemBuilder: (BuildContext context, int index) {
                          var studentData = _displayedData[index];
                          String studentName = studentData['name'];
                          String profilePictureUrl = studentData['profile_picture_url'] ??
                              'assets/images/blank-profile-picture.png';
                          bool isAttending = studentData['is_attending'];
                                    
                          return Card(
                            color: Colors.white,
                            elevation: 5,
                            margin: const EdgeInsets.only(bottom: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: profilePictureUrl.isNotEmpty
                                                  ? NetworkImage(profilePictureUrl, scale: 1)
                                                  : AssetImage(
                                                          'assets/images/blank-profile-picture.png')
                                                      as ImageProvider<Object>?,
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        studentName,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    isAttending ? Icons.check : Icons.close,
                                    color: isAttending ? Colors.green : Colors.red,
                                    size: 40,
                                    
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        // separatorBuilder: (BuildContext context, int index) {
                        //   return SizedBox(height: 10);
                        // },
                      ),
                  ),
                ),
            // Expanded(
            //   child: _isLoading
            //       ? Center(child: CircularProgressIndicator())
            //       : ListView.separated(
            //           itemCount: _displayedData.length,
            //           itemBuilder: (BuildContext context, int index) {
            //             var studentData = _displayedData[index];
            //             String studentName = studentData['name'];
            //             String profilePictureUrl = studentData[
            //                 'profile_picture_url' ??
            //                     'assets/images/blank-profile-picture.png'];
            //             bool isAttending = studentData['is_attending'];
                
            //             return ListTile(
            //               leading: CircleAvatar(
            //                 backgroundImage: profilePictureUrl.isNotEmpty
            //                     ? NetworkImage(profilePictureUrl, scale: 1)
            //                     : AssetImage(
            //                             'assets/images/blank-profile-picture.png')
            //                         as ImageProvider<Object>?,
            //               ),
            //               title: Text(studentName),
            //               subtitle: Text(
            //                 isAttending ? 'Attending' : 'Absent',
            //                 style: TextStyle(
            //                   color:
            //                       isAttending ? Colors.green : Colors.red,
            //                 ),
            //               ),
            //             );
            //           },
            //           separatorBuilder: (BuildContext context, int index) {
            //             return SizedBox(
            //               height: 10,
            //             );
            //           },
            //         ),
            // ),
          ],
        ),
      ),
    );
  }
}





























// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class StudentAttendancePage extends StatefulWidget {
//   final String courseId;

//   const StudentAttendancePage({super.key, required this.courseId});
//   @override
//   _StudentAttendancePageState createState() => _StudentAttendancePageState();
// }

// class _StudentAttendancePageState extends State<StudentAttendancePage> {
//   late DatabaseReference _databaseReference;
//   List<Map<String, dynamic>> _attendanceData = [];
//   List<Map<String, dynamic>> _studentData = [];
//   List<Map<String, dynamic>> _displayedData = [];
//   String _selectedOption = 'All';
//   List<QueryDocumentSnapshot> data = [];
//   List<QueryDocumentSnapshot> dataOfStudent = [];
//   int? numofstudent;
//   Future getData() async {
//     QuerySnapshot querySnapshot = await FirebaseFirestore.instance
//         .collection('Teachers')
//         .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
//         .get();

//     data.addAll(querySnapshot.docs);
//     String docId = data[0].id;

//     QuerySnapshot querySnapshotStu = await FirebaseFirestore.instance
//         .collection('Teachers')
//         .doc(docId)
//         .collection('courses')
//         .doc(widget.courseId)
//         .collection('students')
//         .get();

//     dataOfStudent.addAll(querySnapshotStu.docs);
//     numofstudent = dataOfStudent.length;
// setState(() {
//   _studentData = List<Map<String, dynamic>>.from(
//     querySnapshotStu.docs
//         .map((DocumentSnapshot doc) => doc.data() as Map<String, dynamic>)
//         .toList(),
//   );
//   _updateDisplayedData();
// });
//   }

//   @override
//   void initState() {
//     super.initState();
//     Firebase.initializeApp().then((value) {
//       _databaseReference = FirebaseDatabase.instance.ref().child('attendance');
//       _databaseReference.onValue.listen((event) {
//         var data = event.snapshot.value;
//         if (data != null) {
//           setState(() {
//             _attendanceData = List.from(data as  List<Map<String, dynamic>> );
//             _updateDisplayedData();
//           });
//         }
//       });
//       getData();
//     });
//   }

//   void _updateDisplayedData() {
//     _displayedData = [];
//     if (_selectedOption == 'All') {
//       for (var student in _studentData) {
//         String studentId = student['idStudent'];
//         String studentName = student['name'];
//         String profilePictureUrl = student['url'];
//         bool isAttending = _isStudentAttending(studentName);
//         _displayedData.add({
//           'name': studentName,
//           'profile_picture_url': profilePictureUrl,
//           'is_attending': isAttending,
//         });
//       }
//     } else if (_selectedOption == 'Attending') {
//       for (var student in _studentData) {
//         String studentId = student['idStudent'];
//         String studentName = student['name'];
//         String profilePictureUrl = student['url'];
//         bool isAttending = _isStudentAttending(studentName);
//         if (isAttending) {
//           _displayedData.add({
//             'name': studentName,
//             'profile_picture_url': profilePictureUrl,
//             'is_attending': isAttending,
//           });
//         }
//       }
//     } else if (_selectedOption == 'Absent') {
//       for (var student in _studentData) {
//         String studentId = student['idStudent'];
//         String studentName = student['name'];
//         String profilePictureUrl = student['url'];
//         bool isAttending = _isStudentAttending(studentName);
//         if (!isAttending) {
//           _displayedData.add({
//             'name': studentName,
//             'profile_picture_url': profilePictureUrl,
//             'is_attending': isAttending,
//           });
//         }
//       }
//     }
//   }

//   bool _isStudentAttending(String studentName) {
//     for (var attendance in _attendanceData) {
//       if (attendance['name'] == studentName.toUpperCase()) {
//         return attendance['is_attending'];
//       }
//     }
//     return false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text('Student Attendance'),
//       // ),
//       body: Container(
//      width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height,
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//           //   mainAxisSize: MainAxisSize.min,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: DropdownButtonFormField<String>(
//                   value: _selectedOption,
//                   onChanged: (newValue) {
//                     setState(() {
//                       _selectedOption = newValue as String;
//                       _updateDisplayedData();
//                     });
//                   },
//                   items: [
//                     DropdownMenuItem(
//                       value: 'All',
//                       child: Text('All'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'Attending',
//                       child: Text('Attending'),
//                     ),
//                     DropdownMenuItem(
//                       value: 'Absent',
//                       child: Text('Absent'),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: _displayedData.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     var student = _displayedData[index];
//                     return ListTile(
//                       leading: CircleAvatar(
//                         backgroundImage:
//                             NetworkImage(student['profile_picture_url']),
//                       ),
//                       title: Text(student['name']),
//                       trailing: student['is_attending']
//                           ? Icon(Icons.check, color: Colors.green)
//                           : Icon(Icons.close, color: Colors.red),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       // floatingActionButton: StreamBuilder(
//       //   stream: _databaseReference```dart
//       // .onValue,
//       //   builder: (BuildContext context, AsyncSnapshot<Event> snapshot) {
//       //     if (snapshot.hasData && snapshot.data.snapshot.value != null) {
//       //       return FloatingActionButton(
//       //         onPressed: () {
//       //           // Navigate to the result page
//       //         },
//       //         child: Icon(Icons.result),
//       //       );
//       //     } else {
//       //       return FloatingActionButton(
//       //         onPressed: null, // Disable the button
//       //         child: Icon(Icons.result),
//       //       );
//       //     }
//       //   },
//       // ),
//     );
//   }
// }
