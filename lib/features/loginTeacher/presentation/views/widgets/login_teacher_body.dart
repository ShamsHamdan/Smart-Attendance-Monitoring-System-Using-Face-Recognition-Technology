import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class LoginTeacherBody extends StatefulWidget {
  const LoginTeacherBody({super.key});

  @override
  State<LoginTeacherBody> createState() => _LoginTeacherBodyState();
}

class _LoginTeacherBodyState extends State<LoginTeacherBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(''), // Empty title
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 25,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          toolbarHeight: 50,
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 2),
            child: Image.asset(AssetsData.logowhitesmall),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 40),
            child: Center(
              
              child: Text("Attendance System",style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
            ),
          ),
          Container(
            height: 480,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(90),
                    bottomRight: Radius.circular(90))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: kPrimaryColor,
                            ),
                            contentPadding: EdgeInsets.only(left: 30),
                            hintText: ' Email',
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10.0))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: kPrimaryColor,
                            ),
                            contentPadding: EdgeInsets.only(left: 30),
                            hintText: ' Password',
                            fillColor: Colors.grey[300],
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(15.0))),
                      ),
                    ],
                  ),
                ),
               
                ElevatedButton(
                  onPressed: () {
                     Navigator.pushNamed(context, "/homeTeacher");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 106, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27))),
                  ),
                  child: Text(
                    "login",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
