import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/courseTeacher/Course_Teacher.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class RecntlyAddCourses extends StatelessWidget {
  const RecntlyAddCourses({super.key});

  @override
  Widget build(BuildContext context) {
    double attendancePercentage = .75;
    bool isLowAttendance = attendancePercentage <= 0.5;
    return Column(children: [
      SizedBox(
        height: 60,
      ),
      Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text("Recently added courses",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            width: 60,
          ),
          GestureDetector(
            onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => CourseTeacher()));
                //Navigator.pushNamed(context, "/maintabcoursesinteacher");
            },
            child: Text("see all",
                style: TextStyle(
                    color: Color.fromARGB(255, 149, 149, 149), fontSize: 19)),
          )
        ],
      ),
      SizedBox(
        height: 30,
      ),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Container(
                width: 340,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      ),
                                      Text(
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
            SizedBox(
              width: 30,
            ),
            Container(
                width: 340,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      ),
                                      Text(
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
          ]))
    ]);
  }
}
