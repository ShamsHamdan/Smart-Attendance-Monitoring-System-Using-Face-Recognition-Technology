import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class getStartedBody extends StatelessWidget {
  const getStartedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment(1.0, -1.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsData.cam),
          ),
        ),
        Align(
          alignment: Alignment(-.8, -.5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Welcome", 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  )),
                Text("to",
                 style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  )),
                Text("Attendance System", 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  )),
              ],
            ),
          ),
        ),
        SizedBox(height: 100),
         Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Handle the first button press
                },
                 style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Background color
                  onPrimary: kPrimaryColor, // Text color
                  side: BorderSide(color:kPrimaryColor, width: 2),
                  minimumSize: Size(250, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set the border radius
                  ), // Border color and width
                ),
                child: Text('Continue as a student',
                 style: TextStyle(
                  fontSize: 18,
                  )
                
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle the second button press
                },
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor, // Background color
                  onPrimary: Colors.white, // Text color
                  side: BorderSide(color:kPrimaryColor, width: 2),
                  minimumSize: Size(250, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Set the border radius
                  ), // Border color and width
                ),
                child: Text('Continue as a teacher',
                  style: TextStyle(
                  fontSize: 18,
                  )
                
                
                ),
              ),
            ],
          ),







       
      ],
    );
  }
}
