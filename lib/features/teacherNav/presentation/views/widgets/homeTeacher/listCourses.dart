import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ListCourses extends StatelessWidget {
  const ListCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 50,
      ),
     const Column(
        children: [
          SizedBox(
            width: 20,
          ),
          Text("My Courses",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 23,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    const  SizedBox(
        height: 30,
      ),
      SingleChildScrollView(
          // scrollDirection: Axis.vertical,
          child: Column(children: <Widget>[
       const SizedBox(
          width: 20,
        ),
        Container(
            width: 370,
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
                        height: 120, // Set the desired height
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
                          padding: EdgeInsets.all(15),
                          child: Stack(
                            children: [
                          const    Column(
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
                                  radius: 26.0,
                                  lineWidth: 5.0,
                                  percent:
                                      0.75, // Change this to your actual percentage
                                  center: Text(
                                      "75%"), // Change this to your actual text
                                  progressColor: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])))),
        SizedBox(
          height: 30,
        ),
        Container(
            width: 370,
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
                        height: 120, // Set the desired height
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
                                  radius: 26.0,
                                  lineWidth: 5.0,
                                  percent:
                                      0.75, // Change this to your actual percentage
                                  center: Text(
                                      "75%"), // Change this to your actual text
                                  progressColor: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])))),
        const SizedBox(
          height: 30,
        ),
        Container(
            width: 370,
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
                        height: 120, // Set the desired height
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
                                  radius: 26.0,
                                  lineWidth: 5.0,
                                  percent:
                                      0.75, // Change this to your actual percentage
                                  center: const Text(
                                      "75%"), // Change this to your actual text
                                  progressColor: kPrimaryColor,
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
