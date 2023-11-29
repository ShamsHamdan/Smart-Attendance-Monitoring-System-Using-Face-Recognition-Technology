

import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';


class ListOfSpecialtiesAdmin extends StatelessWidget {
  final List<String> facultyList = [
    'Computer systems engineering Department',
    'Architecture Engineering Department',
    'Electrical Engineering Department',
    'Civil Engineering Department',
    'Computer Science Department',
    'Multimedia Technology Department',
    'Geographic Information Systems (GIS) Department',
  ];

  String filter = '';

  ListOfSpecialtiesAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> filteredList = facultyList
        .where(
            (faculty) => faculty.toLowerCase().contains(filter.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: const Text(
          'List of Academic  Department',
          style: TextStyle(fontSize: 22),
        ),
        centerTitle: true, // Empty title
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        toolbarHeight: 50,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [

                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextField(
                      onChanged: (value) {
                        filter = value;
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: 'Search of Department ',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
          GestureDetector(
          onTap: () {
        Navigator.pushNamed(context, '/listOfCourses');
          },
          child: Container(
          width: 380,
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
                      height: 130, // Set the desired height
                      child: Image.asset(
                        AssetsData.webcourse,
                        fit: BoxFit.cover,
                        //  width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Computer systems engineering Department",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(top: 5),
                                // ),
                                
                              ],
                            ),
                          
                          ],
                        ),
                      ),
                    ),
                  ])))),
        ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: () {
       // Navigator.pushNamed(context, "/CourseInTeacherTabNav");
          },
          child: Container(
          width: 380,
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
                      height: 130, // Set the desired height
                      child: Image.asset(
                        AssetsData.webcourse,
                        fit: BoxFit.cover,
                        //  width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Architecture Engineering Department",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(top: 5),
                                // ),
                                
                              ],
                            ),
                          
                          ],
                        ),
                      ),
                    ),
                  ])))),
        ),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: () {
       // Navigator.pushNamed(context, "/CourseInTeacherTabNav");
          },
          child: Container(
          width: 380,
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
                      height: 130, // Set the desired height
                      child: Image.asset(
                        AssetsData.webcourse,
                        fit: BoxFit.cover,
                        //  width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Electrical Engineering Department",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(top: 5),
                                // ),
                                
                              ],
                            ),
                          
                          ],
                        ),
                      ),
                    ),
                  ])))),
        ),SizedBox(height: 20,),
        GestureDetector(
          onTap: () {
       // Navigator.pushNamed(context, "/CourseInTeacherTabNav");
          },
          child: Container(
          width: 380,
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
                      height: 130, // Set the desired height
                      child: Image.asset(
                        AssetsData.webcourse,
                        fit: BoxFit.cover,
                        //  width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Civil Engineering Department",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(top: 5),
                                // ),
                                
                              ],
                            ),
                          
                          ],
                        ),
                      ),
                    ),
                  ])))),
        ),SizedBox(height: 20,),
        GestureDetector(
          onTap: () {
        Navigator.pushNamed(context, "/Teachers");
          },
          child: Container(
          width: 380,
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
                      height: 130, // Set the desired height
                      child: Image.asset(
                        AssetsData.webcourse,
                        fit: BoxFit.cover,
                        //  width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Computer Science Department",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(top: 5),
                                // ),
                                
                              ],
                            ),
                          
                          ],
                        ),
                      ),
                    ),
                  ])))),
        ),
        
            SizedBox(height: 20,),
          GestureDetector(
          onTap: () {
      //  Navigator.pushNamed(context, "/CourseInTeacherTabNav");
          },
          child: Container(
          width: 380,
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
                      height: 130, // Set the desired height
                      child: Image.asset(
                        AssetsData.webcourse,
                        fit: BoxFit.cover,
                        //  width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Geographic Information Systems (GIS) Department",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(top: 5),
                                // ),
                                
                              ],
                            ),
                          
                          ],
                        ),
                      ),
                    ),
                  ])))),
        ),
        
            SizedBox(height: 20,),
          GestureDetector(
          onTap: () {
       // Navigator.pushNamed(context, "/CourseInTeacherTabNav");
          },
          child: Container(
          width: 380,
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
                      height: 130, // Set the desired height
                      child: Image.asset(
                        AssetsData.webcourse,
                        fit: BoxFit.cover,
                        //  width: double.infinity,
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 90,
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.all(15),
                        child: Stack(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Multimedia Technology Department",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                // Padding(
                                //   padding: EdgeInsets.only(top: 5),
                                // ),
                                
                              ],
                            ),
                          
                          ],
                        ),
                      ),
                    ),
                  ])))),
        ),
        SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}































// import 'package:flutter/material.dart';
// import 'list_of_courses_page.dart';

// class ListOfSpecialtiesPage extends StatelessWidget {
//   final List<String> facultyList = [
//     'Computer systems engineering Department',
//     'Architecture Engineering Department',
//     ' Electrical Engineering Department ',
//     ' Civil Engineering Department ',
//     ' Computer Science Department',
//     ' Multimedia Technology Department',
//     ' Geographic Information Systems (GIS) Department',
//   ];

//   String filter = '';

//   ListOfSpecialtiesPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List<String> filteredList = facultyList
//         .where((faculty) =>
//             faculty.toLowerCase().contains(filter.toLowerCase()))
//         .toList();

//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: Theme.of(context).primaryColor,
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(30),
//                 bottomRight: Radius.circular(30),
//               ),
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(height: 50),
//                 const ListTile(
//                   contentPadding: EdgeInsets.symmetric(horizontal: 30),
//                   title: Text(
//                     'List of Academic  Department',
//                     style: TextStyle(color: Colors.white, fontSize: 20),
//                   ),
//                   trailing: CircleAvatar(
//                     radius: 20,
//                     backgroundImage: AssetImage('assets/images/school.jpeg'),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: TextField(
//                     onChanged: (value) {
                       
//                       filter = value;
//                     },
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: 'Search of Department ',
//                       hintStyle: const TextStyle(color: Colors.white70),
//                       prefixIcon: const Icon(Icons.search, color: Colors.white,),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               color: Theme.of(context).primaryColor,
//               child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 decoration: const BoxDecoration(
//                   color: Colors.white,
                   
//                 ),
//                 child: GridView.count(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 40,
//                   mainAxisSpacing: 30,
//                   children: filteredList
//                       .map((faculty) => GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) => ListOfCoursesPage(),  
//                                 ),
//                               );
//                             },
//                             child: itemDashboard(
//                               context,
//                               faculty,
//                               'assets/images/school.jpeg',
//                               Colors.blue,
//                             ),
//                           ))
//                       .toList(),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget itemDashboard(BuildContext context, String title, String imagePath, Color background) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//           borderRadius: BorderRadius.only(
//           topRight: Radius.circular(500),
           
//         ),
//         boxShadow: [
//           BoxShadow(
//             offset: const Offset(0, 5),
//             color: Theme.of(context).primaryColor.withOpacity(.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             color: background,
//             child: Image.asset(
//               imagePath,
//               width: 60,
//               height: 60,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             title,
//             style: const TextStyle(color: Colors.black, fontSize: 14),
//             textAlign: TextAlign.center,
//           )
//         ],
//       ),
//     );
//   }
// }