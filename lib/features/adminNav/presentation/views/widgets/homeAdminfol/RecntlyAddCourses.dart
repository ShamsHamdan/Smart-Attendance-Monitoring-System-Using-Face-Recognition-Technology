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
              "Recently Added Courses",
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
                                    "ENG",
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


