import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class studentStatistics extends StatelessWidget {
  const studentStatistics({super.key});

  @override
  Widget build(BuildContext context) {
    return   Column(   
    //  mainAxisAlignment: MainAxisAlignment.start,
     
       
              children: [
                Align(
                    alignment: Alignment.topLeft,
                  child: Text("Weekly Attendance",
                              style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
                ),
          SizedBox(
            height: 20,
          ),
        // Text("Weekly Attendance",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 70,
                    lineWidth: 15,
                    percent: 0.85,
                    center: const Text('85.0%',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.green ),),
                    footer: const Text('Attendance',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.green,
                    animation: true,
                    animationDuration: 4000,
                  
                  ),
                  const SizedBox(width: 30,),
                    CircularPercentIndicator(
                    radius: 70,
                    lineWidth: 15,
                    percent: 0.15,
                    center: const Text('15.0%',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color:Colors.red),),
                   
                    footer: const Text('Absent',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Colors.red,
                    animation: true,
                    animationDuration: 4000,
                  
                  ),
                 
                   
                ],
              ),
        ),
      ],
    );
  
  }
}
