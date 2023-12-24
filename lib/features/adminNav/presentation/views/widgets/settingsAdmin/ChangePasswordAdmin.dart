import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';

class ChangePasswordAdmin extends StatefulWidget {
  const ChangePasswordAdmin({super.key});

  @override
  State<ChangePasswordAdmin> createState() => _ChangePasswordAdminState();
}

class _ChangePasswordAdminState extends State<ChangePasswordAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.grey[100],
      appBar: AppBar(
       backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(''), // Empty title
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 25,color: Colors.black,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
  //             Positioned(
  //               top: 0,
  //               left: 0,
  //               child: IconButton(
  //   icon: Icon(Icons.arrow_back,size: 25,),
  //   onPressed: () {
  //     Navigator.pop(context);
  //   },
  // ),),
              Container(
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 50, 20, 10),
                  child: Text(
                    'Change Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 38,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8.0, 20, 20),
                  child: Text(
                    'Enter your new password',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50,),
              Container(
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
              ),
              Container(
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Current Password',
                    ),
                  ),
                ),
              ),
               Container(
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New Password',
                    ),
                  ),
                ),
              ),
              Container(
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm Password',
                    ),
                  ),
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(32.0)))
                                        
                                        ),
                    child: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}