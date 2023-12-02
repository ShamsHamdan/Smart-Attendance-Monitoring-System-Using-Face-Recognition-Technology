

import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ListCoursestest extends StatefulWidget {
  const ListCoursestest({super.key});

  @override
  State<ListCoursestest> createState() => _ListCoursestestState();
}

class _ListCoursestestState extends State<ListCoursestest> {

  
  
  @override
  Widget build(BuildContext context) {
     double attendancePercentage = .75;
    bool isLowAttendance = attendancePercentage <= 0.5;
   bool showSearchField = false;

    return SingleChildScrollView(
      child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          SizedBox(
            height: 70,
          ),
         Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [
               Column(
                  children: [
                    SizedBox(
                      width: 100,
                    ),
                    Text("My Courses",
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 26,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
IconButton(
  icon: Icon(
    Icons.search,
    color: Colors.black,
    size: 30,
  ),
  onPressed: () {
    setState(() {
      showSearchField = true; // Set showSearchField to true
    });
  },
),
if (showSearchField)
  Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search for a course...',
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.cancel, color: Colors.black),
          onPressed: () {
            setState(() {
              showSearchField = false;
            });
          },
        ),
      ],
    ),
  ),
              
             ],
           ),
         ),
            
            
      
        const  SizedBox(
            height: 30,
          ),
          Column(
            //shrinkWrap: true,
            children: <Widget>[
           const SizedBox(
          width: 20,
            ),
            GestureDetector(
              onTap: (){
                  Navigator.pushNamed(context, "/CourseInTeacherTabNav");
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
                          height: 100,
                          child: Container(
                            padding: EdgeInsets.all(15),
                            child: Stack(
                              children: [
                            const    Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "Artificial Intelligence Section1",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                    ), Text(
                                        'EIT',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    Text(
                                      '230214990',
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
                                      progressColor: isLowAttendance
                                          ? Colors.red
                                          : Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ])))),
            ),
            SizedBox(
          height: 20,
            ),
            Container(
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
                        height: 100,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Stack(
                            children: [
                             const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "INTERNSHIP Section1",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                  ), Text(
                                        'EIT',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                  Text(
                                    '230214990',
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
                                      progressColor: isLowAttendance
                                          ? Colors.red
                                          : Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])))),
            const SizedBox(
          height: 20,
            ),
            Container(
            width: 380,
            margin:const EdgeInsets.only(bottom: 15),
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
                        height: 100,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Stack(
                            children: [
                             const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "INTERNSHIP Section1",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                  ), Text(
                                        'EIT',
                                        style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                  Text(
                                    '230214990',
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
                                      progressColor: isLowAttendance
                                          ? Colors.red
                                          : Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])))),
          ])
        ]),
      ),
    );
  }
}
