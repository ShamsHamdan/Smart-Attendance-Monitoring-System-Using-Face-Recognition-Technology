import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child:
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
               children: <Widget>[
                 SizedBox(height: 20),
          Container(
            height: 410,
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
                  "Signup",
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
                            hintText: 'Full Name',
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
                              Icons.email,
                              color: kPrimaryColor,
                            ),
                            contentPadding: EdgeInsets.only(left: 30),
                            hintText: 'User Email',
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
                    Navigator.pushNamed(context, "/homeadmin");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                    padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(horizontal: 106, vertical: 10)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(27))),
                  ),
                  child: Text(
                    "Signup",
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