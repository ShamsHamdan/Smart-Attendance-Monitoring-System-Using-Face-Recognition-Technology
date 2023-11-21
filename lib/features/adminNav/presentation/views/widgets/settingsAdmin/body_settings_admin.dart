import 'package:first_version/constants.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/card.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/settingsAdmin/data.dart';
import 'package:flutter/material.dart';

class BodySettningsAdmin extends StatelessWidget {
  const BodySettningsAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 200,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30))),
              ),
              Positioned(
                top: 40,
                left: 20,
                right: 20,
                child: Container(
                  // width: MediaQuery.of(context).size.width*0.8,
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
                  child: SizedBox(
                    height: 60,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          ' Admin',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color.fromRGBO(51, 110, 131, 1)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        // Text(
                        //   '+91 9876543210',
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 16,
                        //       color: Color(0xff065e54)),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Electroinc Attendance Department",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.4,
                // right: 130,
                // left: 130,
                top: 0,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/blank-profile-picture-973460_1280.png'),
                  radius: 40,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "General",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(51, 110, 131, 1),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // SizedBox(
                //   height: 300,
                //   child:
                // Column(
                //     // Wrap ListView.builder with Column
                //     children: [

                Expanded(
                  child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        if (data[index].label == "Change Password") {
                          return GestureDetector(
                            onTap: () {
                              // Navigate to the new page here
                              Navigator.pushNamed(
                                  context, "/changepassowrdadmin");
                            },
                            child: cards(context, index),
                          );
                        } else if (data[index].label == "Edit Profile") {
                          return GestureDetector(
                            onTap: () {
                              // Navigate to the new page here
                              Navigator.pushNamed(context, "/editProfileadmin");
                            },
                            child: cards(context, index),
                          );
                        } else if (data[index].label ==
                            "Terms and Conditions") {
                          return GestureDetector(
                            onTap: () {
                              // Navigate to the new page here
                              Navigator.pushNamed(
                                  context, "/TermsandConditions");
                            },
                            child: cards(context, index),
                          );
                        } else {
                          return cards(context, index);
                        }
                      }),
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .95,
                  height: 60,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "LOG OUT",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
