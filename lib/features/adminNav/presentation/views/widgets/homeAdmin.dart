import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 320,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30))),
                  ),
                  Positioned(
                    top: 100,
                    left: 20,
                    child: Text('Hi Admin',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white)),
                  ),
                  Positioned(
                    top: 70,
                    right: 0,
                    child: Image.asset(AssetsData.logoforadminhome),
                  ),
                  Positioned(
                    top: 200,
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
                                offset: Offset(0, 5.0)),
                          ]),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 60,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Icon(
                                Icons.class_,
                                size: 37,
                                color: kPrimaryColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "200",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Courses",
                                style: TextStyle(fontSize: 15),
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
                              Icon(
                                Icons.person,
                                size: 37,
                                color: kPrimaryColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "200",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Teachers",
                                style: TextStyle(fontSize: 15),
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
                              Icon(
                                Icons.school,
                                size: 37,
                                color: kPrimaryColor,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "200",
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Students",
                                style: TextStyle(fontSize: 15),
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
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Color(0xFFE4E7EC),
                            width: 2,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 255, 255, 255),
                          radius: 30,
                          child: Icon(
                            Icons.person_outline,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      const Text(
                        "Add Teacher",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Color(0xFFE4E7EC),
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 1),
                          radius: 30,
                          child: Icon(
                            Icons.library_books_outlined,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        "Add Course ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                            color: Color(0xFFE4E7EC),
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromRGBO(255, 255, 255, 1),
                          radius: 30,
                          child: Icon(
                            Icons.bar_chart,
                            color: kPrimaryColor,
                            size: 30,
                          ),
                        ),
                      ),
                      SizedBox(height: 7),
                      const Text(
                        "Statistics",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text("Recently added courses",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 100,
                ),
                Text("see all",
                    style: TextStyle(
                        color: Color.fromARGB(255, 149, 149, 149),
                        fontSize: 18))
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
                                Image.asset(
                                  'assets/images/logohomeadmin.png',
                                  fit: BoxFit.cover,
                                  //  width: double.infinity,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
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
                                        '230214990',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ])))),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
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
                                Image.asset(
                                  'assets/images/logohomeadmin.png',
                                  fit: BoxFit.cover,
                                  //  width: double.infinity,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
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
                                        '230214990',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                              )
                              )
                              )
                              
                              ),
                ]
                )
                ),
                 SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text("Recently added teacher",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  width: 100,
                ),
                Text("see all",
                    style: TextStyle(
                        color: Color.fromARGB(255, 149, 149, 149),
                        fontSize: 18))
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
                      width: 200,
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
                                Image.asset(
                                  'assets/images/logohomeadmin.png',
                                  fit: BoxFit.cover,
                                  //  width: double.infinity,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Osama Salameh",
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
                                        '201010500',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ])))),
                  SizedBox(
                    width: 30,
                  ),
                  Container(
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
                                Image.asset(
                                  'assets/images/logohomeadmin.png',
                                  fit: BoxFit.cover,
                                  //  width: double.infinity,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Mohammad Awad",
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
                                        '200710000',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]
                              )
                              )
                              )
                              
                              ),
                ]
                )
                )
          ]),
        ),






                






        
        
        
        
        );
  }
}
