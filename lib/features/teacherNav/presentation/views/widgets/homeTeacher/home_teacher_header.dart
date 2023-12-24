import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class HomeTeacherHeader extends StatelessWidget {
  const HomeTeacherHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: const Padding(
            padding: EdgeInsets.only(top: 80.0, left: 20, right: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(AssetsData.profMoh),
                  // Replace with actual image path
                ),
                SizedBox(width: 20),
                Padding(
                  padding: EdgeInsets.only(right: .0, left: 8, top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mohammad Awad',
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
                        style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '200710000',
                        style: TextStyle(fontSize: 18, color: Colors.white,fontWeight: FontWeight.bold),
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
              child: const Row(
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
                        "80",
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
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                        "70",
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
                                fontSize: 16, fontWeight: FontWeight.bold),
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
                        "10",
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
                              fontWeight: FontWeight.bold, // Make the text bold
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Absent",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
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
  }
}
