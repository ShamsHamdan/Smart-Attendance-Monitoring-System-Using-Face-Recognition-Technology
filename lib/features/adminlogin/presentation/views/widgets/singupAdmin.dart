import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
 // CollectionReference admins = FirebaseFirestore.instance.collection('Admins');
  // var userCredential;
  // Retrieve the UID of the created user
  // String uid = userCredential.user!.uid;

  Future<void> addAdmin() async {
    // Call the user's CollectionReference to add a new user
 await FirebaseFirestore.instance.collection('Admins').add({
          "name": username.text,
          "email": email.text,
          "id":FirebaseAuth.instance.currentUser!.uid,
        })
        .then((value) => print("===================================admin Added"))
        .catchError((error) => print("=============================Failed to add admin: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
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
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Form(
                        key: formState,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              validator: (val) {
                                if (val == "") {
                                  return "Empty filed";
                                }
                              },
                              controller: username,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: kPrimaryColor,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 30),
                                  hintText: 'Full Name',
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val == "") {
                                  return "Empty filed";
                                }
                              },
                              controller: email,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: kPrimaryColor,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 30),
                                  hintText: 'Email',
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(10.0))),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              validator: (val) {
                                if (val == "") {
                                  return "Empty filed";
                                }
                              },
                              obscureText: true,
                              controller: pass,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.vpn_key,
                                    color: kPrimaryColor,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 30),
                                  hintText: ' Password',
                                  fillColor: Colors.grey[300],
                                  filled: true,
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                      borderRadius:
                                          BorderRadius.circular(15.0))),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (formState.currentState!.validate()) {
                          try {
                            final credential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: email.text,
                              password: pass.text,
                            );
                            addAdmin();
                            // FirebaseFirestore.instance
                            //     .collection('Admins')
                            //     .add({'name': username.text,
                            //   'email': email.text,});
                            //  String uid = userCredential.user.uid;
                            // await admins.add({
                            //   'name': username,
                            //   'email': email,
                            // });
                            Navigator.pushNamed(context, "/homeadmin");
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              print('The password provided is too weak.');
                            } else if (e.code == 'email-already-in-use') {
                              print(
                                  'The account already exists for that email.');
                              AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                      titleTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22),
                                      desc:
                                          'The account already exists for that email.',
                                      descTextStyle: TextStyle(fontSize: 17))
                                  .show();
                            }
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          print("========err");
                          // AwesomeDialog(
                          //         context: context,
                          //         dialogType: DialogType.error,
                          //         animType: AnimType.rightSlide,
                          //         title: 'Error',
                          //         titleTextStyle: TextStyle(
                          //             fontWeight: FontWeight.bold,
                          //             fontSize: 22),
                          //         desc:
                          //             'The account already exists for that email.',
                          //         descTextStyle: TextStyle(fontSize: 17))
                          //     .show();
                        }

                        // Navigator.pushNamed(context, "/homeadmin");
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(kPrimaryColor),
                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                            horizontal: 106, vertical: 10)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27))),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(fontSize: 24, color: Colors.white),
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
