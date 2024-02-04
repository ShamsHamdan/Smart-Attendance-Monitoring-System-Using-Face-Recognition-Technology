import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';

import 'package:flutter/material.dart';

class HomeTeacherHeader extends StatefulWidget  {
  const HomeTeacherHeader({super.key});

  @override
  State<HomeTeacherHeader> createState() => _HomeTeacherHeaderState();
}

class _HomeTeacherHeaderState extends State<HomeTeacherHeader>    {
  //final PageController _pageController = PageController();
  String? url;
  DocumentSnapshot? data1;
  String? name;
  String? id;
  String? docId;
  String? courseId;
  int? numofattending;
  int? numofabsent;
  int? numofstudent;
  int? numofstudentfromcourse;
  List<QueryDocumentSnapshot> dataOfStudent = [];

  List<QueryDocumentSnapshot> dataOfCourses = [];
  bool dataFetched = false;

  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    DocumentSnapshot data1 = querySnapshot.docs[0];
    url = data1['url'];
    name = data1['name'];
    id = data1['id'];
    docId = data1.id;

    setState(() {
      print("****************************************$url");
    });

    QuerySnapshot querySnapshott = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .get();

    dataOfCourses.addAll(querySnapshott.docs);
    courseId = dataOfCourses[0].id;
    setState(() {});

    QuerySnapshot querySnapshotStu = await FirebaseFirestore.instance
        .collection('Teachers')
        .doc(docId)
        .collection('courses')
        .doc(courseId)
        .collection('students')
        .get();

    dataOfStudent.addAll(querySnapshotStu.docs);
    numofstudentfromcourse = dataOfStudent.length;
    setState(() {
      // print("${data[0]['name']}");
      // Adminemail = data['email'];
      // Adminpass = data['password'];
    });
  }

  Future<void> getDataAtten() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('Teachers')
          .doc(docId)
          .collection('courses')
          .doc(courseId)
          .collection('attendance')
          .orderBy('date', descending: true)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final attendanceData =
            snapshot.docs.first.data() as Map<String, dynamic>;
        numofattending = attendanceData['attending'] ?? 0;
        numofabsent = attendanceData['absent'] ?? 0;
        // numofstudent = attendanceData['allNumber'] ?? 0;
      } else {
        // No attendance collection found, set numbers to zero
        numofattending = 0;
        numofabsent = 0;
        //  numofstudent = numofstudentfromcourse;
      }

      setState(() {
        print('$numofattending');
      });
    } catch (error) {
      // Handle any potential errors
      print('Error getting attendance data: $error');
      // Set numbers to zero
      numofattending = 0;
      numofabsent = 0;
      numofstudent = 0;
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  //  WidgetsBinding.instance.addPostFrameCallback((_) {
      getData().then((_) =>  getDataAtten() ,);
    
      print("hello home");
   // });
  }

  // @override
  // void didUpdateWidget(HomeTeacherHeader oldWidget) {
  //   super.didUpdateWidget(oldWidget);
  //   fetchData();
  // }

  // void fetchData() async {
  //   await getData();
  //   await getDataAtten();
  //   print("Data fetching completed successfully");
  // }
  // @override
  // initState() {
  //   super.initState();
  //   //  WidgetsBinding.instance.addPostFrameCallback((_) =>
  //   getData().then((_) => getDataAtten());
  //   // );
  //   print("hi");
  // }

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  // void fetchData() async {
  //   print("hi");
  //   if (!dataFetched) {
  //     // await getData()
  //     print("jjjjj");
  //     await getDataAtten();
  //     dataFetched = true;
  //     setState(() {}); // Set the flag to indicate data has been fetched
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    

    // dataFetched = false;
    // getData().then((_) => getDataAtten());
    return SizedBox(
      height: 300,
      child: PageView.builder(
          itemCount: 1, // Only one page

          // controller: _pageController,
          itemBuilder: (BuildContext context, int index) {
           // fetchData();
           // dataFetched = false;
            return Stack(
              children: [
                Container(
                  height: 300,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(83, 157, 185, 1),
                        Colors.grey
                      ], // Change these colors
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: 80.0, left: 20, right: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: url != null && url!.isNotEmpty
                              ? NetworkImage(Uri.parse(url!).toString())
                              : AssetImage(AssetsData.profilepic)
                                  as ImageProvider<Object>,
                          // Replace with actual image path
                        ),
                        SizedBox(width: 20),
                        Padding(
                          padding: EdgeInsets.only(right: .0, left: 8, top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${name}',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'EIT',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '${id}',
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //card of the result yesterday
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      // it will cover 90% of our total width

                      height: 85,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 5),
                            blurRadius: 50,
                            color: const Color(0xFF12153D).withOpacity(0.2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 17,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "$numofstudentfromcourse" ?? '0',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.person,
                                    color: kPrimaryColor,
                                    size: 22,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Students",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 17,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "$numofattending" ?? '0',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    size: 25,
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Attending",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 28,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 17,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "$numofabsent",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'X',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight:
                                          FontWeight.bold, // Make the text bold
                                      color: Colors.red,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "Absent",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            width: 20,
                          )
                        ],
                      ),
                    )),
              ],
            );
          }),
    );
  }
  
  // @override
  // // TODO: implement wantKeepAlive
  // bool get wantKeepAlive => throw UnimplementedError();
}
