import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';

class ResAtt extends StatelessWidget {
  const ResAtt({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(
              
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                  child: Text("Recent Attendance Session ",
                              style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
                ),
          SizedBox(
            height: 20,
          ),
                Center(
                child:   GestureDetector(
                      onTap: () {
                         Navigator.pushNamed(
                                      context, "/reslutofattendance");
                                
                      },
                      child:
                    Container(
                      width: MediaQuery.of(context).size.width * .95,
                      height: 60,
                      margin:const EdgeInsets.only(bottom: 45),
                      decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: BorderRadius.circular(20)),
                      child:const Center(
                        
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(Icons.camera_enhance,color: Colors.white,),
                              // SizedBox(width: 5,),
                              Text(
                        "Results",
                        style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                      ),
                            ],
                          )),
                    ))
                 
                ),
              ],
            );
  }
}
