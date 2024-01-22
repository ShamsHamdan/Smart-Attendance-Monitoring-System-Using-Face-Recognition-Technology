import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/card.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/curved_header.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/data.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/nameTeacher.dart';
import 'package:first_version/features/teacherNav/presentation/views/widgets/settingsTeacher/picTeacherSett.dart';
import 'package:flutter/material.dart';

class SettingsTeacherBody extends StatelessWidget {
  const SettingsTeacherBody({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 250,
                width: 500,
                child: Column(children: [
                  Stack(
                    children: [
                      ClipPath(
                        clipper: CurvedCounterClipper(),
                        child: Container(
                          width: double.infinity,
                          height: 110,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
            
                      //        Container(
                      //   width: double.infinity,
                      //   height: 110,
                      //   decoration: BoxDecoration(
                      //       color: kPrimaryColor,
                      //       borderRadius: BorderRadius.only(
                      //           bottomRight: Radius.circular(1000),
                      //           bottomLeft: Radius.circular(1000))),
                      // ),
                      Center(
                          child: Column(children: [
                        SizedBox(height: 20),
                       PicTeacherSettening(),
                      ])),
                    ],
                  ),
            
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: nameTeach(),
                    
                    
                    
                    
                    
                  ),
                  SizedBox(height: 10),
                  Center(
                    child: Text(
                      "Computer System Engineering Department",
                      style: TextStyle(
                          fontSize: 17,
                         // fontFamily: "Calibri",
                          fontStyle: FontStyle.italic,
                          color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ),
                ]),
              ),
            const  SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 430,
                width: 450,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
            
            
                    Expanded(
                    child: Container(
                    // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adjust padding
                      color: Colors.grey[100],
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          if (data[index].label == "Change Password") {
                            return GestureDetector(
                              onTap: () {
                                // Navigate to the new page here
                                Navigator.pushNamed(
                                    context, "/changepassowrdteacher");
                              },
                              child: cards(context, index),
                            );
                          } else if (data[index].label == "Edit Profile") {
                            return GestureDetector(
                              onTap: () {
                                // Navigate to the new page here
                                Navigator.pushNamed(context, "/editProfileteacher");
                              },
                              child: cards(context, index),
                            );
                          } else if (data[index].label ==
                              "Privacy Policy") {
                            return GestureDetector(
                              onTap: () {
                                // Navigate to the new page here
                                Navigator.pushNamed(
                                    context, "/PrivacyPolicy");
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
                          } 
                          
                          
                          
                          
                          
                          
                          else {
                            return cards(context, index);
                          }
                        }),
                  ),
                  ),
                 
                  GestureDetector(
                    onTap: ()async {
                       await FirebaseAuth.instance.signOut();
                       Navigator.pushNamed(
                                    context, "/backwelcompage");
                              
                    },
                    child:
                  Container(
                    width: MediaQuery.of(context).size.width * .95,
                    height: 60,
                    margin:const EdgeInsets.only(bottom: 55),
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child:const Center(
                        child: Text(
                      "LOG OUT",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    )),
                  ))
            
            ],
          ),
                ),
              ]));
  }
}