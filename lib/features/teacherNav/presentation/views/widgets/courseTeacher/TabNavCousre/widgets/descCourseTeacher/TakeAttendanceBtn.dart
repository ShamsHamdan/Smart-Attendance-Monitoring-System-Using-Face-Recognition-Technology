import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class TakeAttendanceBtn extends StatelessWidget {
  const TakeAttendanceBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
       // AwesomeDialog(context: context)
      },
      child: Container(
                 height: 80,
        decoration: BoxDecoration(
            color: kPrimaryColor,
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
                child: Center(child: Row(
                    mainAxisAlignment:MainAxisAlignment.center,
                   // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AssetsData.takeattendancebtn),
                      SizedBox(width: 10,),
                      Text("Take Attendance ",style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white
                      ),)
                    ],
                  ),),
              ),
    );
  }
}