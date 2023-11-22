import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class HomeAdminHeader extends StatelessWidget {
  const HomeAdminHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
        height: 370,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 310,
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
              top: 95,
              right: 10,
             child: CircleAvatar(
              backgroundImage:  AssetImage(AssetsData.profilepic),
              radius: 28,
            ),
             
            ),
            Positioned(
              top: 180,
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
      );
  }
}