

import 'package:flutter/material.dart';

class TermsandConditions extends StatelessWidget {
  const TermsandConditions({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Terms and Conditions',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25),),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to the Smart Attendance System",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                "By using the Smart Attendance System Using Face Recognition in the University app, you agree to comply with and be bound by the following terms and conditions:",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 15),
              _buildTerms("1. Acceptance of Terms", "By using the Smart Attendance System app, you agree to these terms and conditions. If you do not agree with any part of these terms, please do not use the app."),
              _buildTerms("2. User Eligibility", "You must be a registered student or faculty member of Arab American University to use this application. By using the app, you warrant that you are associated with Arab American University."),
              _buildTerms("3. User Account", "You may be required to create an account to access specific features of the application. You are responsible for maintaining the confidentiality of your account and password. Notify us immediately of any unauthorized use of your account."),
              _buildTerms("4. Use of Face Recognition Data", "The App uses face recognition technology for attendance purposes. Your facial data will be securely stored and used only for attendance tracking within Arab American University. We prioritize the privacy and security of your data."),
              _buildTerms("5. User Conduct", "Do not engage in any activity that may impair the functioning of the application. Do not use the app for any illegal or unauthorized purpose."),
              _buildTerms("6. Privacy Policy", "Your use of the Smart Attendance System app is also governed by our Privacy Policy."),
              _buildTerms("7. Termination", "We reserve the right to terminate or suspend your account and access to the application at any time, without notice, for any reason."),
              _buildTerms("8. Changes to Terms", "We may update or modify these terms and conditions at any time without prior notice. It is your responsibility to review these terms periodically."),
              _buildTerms("9. Contact Information", "For any questions about these terms, please contact us at attendance.department@aaup."),
              SizedBox(height: 15),
              Text(
                "By using the Smart Attendance System app, you acknowledge that you have read, understood, and agreed to these terms and conditions.",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTerms(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          content,
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TermsandConditions(),
  ));
}

























// import 'package:flutter/material.dart';

// class TermsandConditions extends StatelessWidget {
//   const TermsandConditions({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        backgroundColor: Colors.grey[100],
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//           title: const Text(''), // Empty title
//           leading: IconButton(
//             icon: Icon(
//               Icons.arrow_back,
//               size: 25,
//               color: Colors.black,
//             ),
//             onPressed: () {
//               Navigator.pop(context);
//             },
//           ),
//         ),
//         body: SingleChildScrollView(
//           child:  Align(
//           alignment: Alignment(-.8, -.5),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child:
          
          
          
//           Column(children: [
//             Center(
//               child: Text(
//                 "Terms and Conditions",
//                 style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Text(
//                 "Welcome to the Smart Attendance System Using Face Recognition in the University app. By using the App, you agree to comply with and be bound by the following terms and conditions:",style: TextStyle(fontSize: 20),),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//                 "1. Acceptance of Terms By using the Smart Attendance System app, you agree to these terms and conditions. If you do not agree with any part of these terms, please do not use the app.",style: TextStyle(fontSize: 20),),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//                 " 2. User Eligibility You must be a registered student or faculty member of Arab American University to use this application. By using the app, you warrant that you are associated with Arab American University.",style: TextStyle(fontSize: 20),),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//                 "  3. User Account You may be required to create an account to access specific features of the application. You are responsible for maintaining the confidentiality of your account and password. Notify us immediately of any unauthorized use of your account.",style: TextStyle(fontSize: 20),),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//                 "4. Use of Face Recognition Data The App uses face recognition technology for attendance purposes. Your facial data will be securely stored and used only for attendance tracking within Arab American University. We prioritize the privacy and security of your data.",style: TextStyle(fontSize: 20),),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//                 "5. User Conduct Do not engage in any activity that may impair the functioning of the application. Do not use the app for any illegal or unauthorized purpose.",style: TextStyle(fontSize: 20),),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//                 "6. Privacy Policy Your use of the Smart Attendance System app is also governed by our Privacy Policy.",style: TextStyle(fontSize: 20),),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//                 "7. Termination We reserve the right to terminate or suspend your account and access to the application at any time, without notice, for any reason.",style: TextStyle(fontSize: 20),),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//                 "8. Changes to TermsWe may update or modify these terms and conditions at any time without prior notice. It is your responsibility to review these terms periodically.",style: TextStyle(fontSize: 20),),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//                 "9. Contact Information For any questions about these terms, please contact us at attendance.department@aaup.",style: TextStyle(fontSize: 20),),
//             SizedBox(
//               height: 15,
//             ),
//             Text(
//                 "By using the Smart Attendance System app, you acknowledge that you have read, understood, and agreed to these terms and conditions.",style: TextStyle(fontSize: 20),),
//           ]),
//         ),
//           )
//     ));
//   }
// }


