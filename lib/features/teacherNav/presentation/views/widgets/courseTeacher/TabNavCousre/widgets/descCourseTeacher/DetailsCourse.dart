import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: kPrimaryColor, // Replace with your desired color
            width: .5, // Replace with your desired width
          ),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                spreadRadius: 1,
                offset: const Offset(0, 5.0)),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 37,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "EIT-008",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Icon(
                    Icons.schedule,
                    size: 37,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "8:30 AM",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                width: 50,
              ),
              Column(
                children: [
                  Icon(
                    Icons.calendar_month,
                    size: 37,
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Mn-Te",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
