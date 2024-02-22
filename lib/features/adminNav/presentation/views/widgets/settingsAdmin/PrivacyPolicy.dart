


import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(''),
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back,
            size: 25,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body:const SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(fontSize: 29, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Overview",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Welcome to the Smart Attendance Monitoring System. This privacy policy is intended for teachers using the system. It outlines the types of information we collect, how we use it, and the security measures in place to protect your data.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                "Information Collected",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Types of Data Collected",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "We collect the following types of data:",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 15),
              Text(
                "- Facial Biometrics:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 12),
              Text(
                "- User Account Information",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 10),
              Text(
                "Use of Collected Information",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Purpose",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                "The collected data is used for:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "- Attendance Tracking",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                "- User Authentication",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 25),
              Text(
                "Data Security",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Security Measures",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 15),
              Text(
                "We implement the following security measures:",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "- Encryption Protocols",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                "- Access Controls",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                "- Regular Security Audits",
                style: TextStyle(fontSize: 20),
              ),

               SizedBox(height: 25),
              Text(
                "User Consent",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Consent to Collect Data",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                "By using the Smart Attendance Monitoring System, you consent to the collection and use of your data for the specified purposes outlined in this privacy policy.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 25),
              Text(
                "Data Sharing",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Third-Party Sharing",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                "We may share data with third parties for:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                "- Third-Party Services:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 12),
              Text(
                "Integration of external services for system functionality.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                "- Collaborations:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 12),
              Text(
                "Collaborative efforts that involve data sharing.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 25),
              Text(
                "Data Retention",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Retention Period",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                "We retain data for:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                "- Attendance Records:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 12),
              Text(
                "As required for historical attendance tracking.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                "- User Account Information:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 12),
              Text(
                "As necessary for account management.",
                style: TextStyle(fontSize: 20),
              ),
               SizedBox(height: 25),
              Text(
                "User Rights",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Access and Control",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                "You have the following rights:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                "- Access to Your Data:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 12),
              Text(
                "Retrieve information related to your account.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                "- Correction of Inaccuracies:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 12),
              Text(
                "Update any inaccuracies in your data.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                "- Deletion of Data:",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 12),
              Text(
                "Request the deletion of your data.",
                style: TextStyle(fontSize: 20),
              ),

            

              SizedBox(height: 25),
              Text(
                "Updates to the Privacy Policy",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Notification of Changes",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                "You will be notified of any changes to this privacy policy.",
                style: TextStyle(fontSize: 20),
              ),

              // ... (remaining code)

              SizedBox(height: 25),
              Text(
                "Contact Information",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Contact for Inquiries",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Text(
                "For inquiries or concerns regarding privacy, please contact us at attendance.department@aaup.",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 25),
              Text(
                "Conclusion",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                "Thank you for using the Smart Attendance Monitoring System.",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
