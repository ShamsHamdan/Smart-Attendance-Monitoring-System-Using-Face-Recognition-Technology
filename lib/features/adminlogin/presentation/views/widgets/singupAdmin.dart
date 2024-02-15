import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController pass = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  // CollectionReference admins = FirebaseFirestore.instance.collection('Admins');
  Future<void> addAdmin() async {
    // Call the user's CollectionReference to add a new user
    await FirebaseFirestore.instance
        .collection('Admins')
        .add({
          "name": username.text,
          "email": email.text,
          "id": FirebaseAuth.instance.currentUser!.uid,
          "password": pass.text,
        })
        .then(
            (value) => print("===================================admin Added"))
        .catchError((error) =>
            print("=============================Failed to add admin: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
          FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: kPrimaryColor,
                                    ),
                                    contentPadding: EdgeInsets.only(left: 30),
                                    hintText: 'Full Name',
                                    fillColor: Colors.grey[300],
                                    filled: true,
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                              ),
                              const SizedBox(
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
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: kPrimaryColor,
                                    ),
                                    contentPadding:
                                        const EdgeInsets.only(left: 30),
                                    hintText: 'Email',
                                    fillColor: Colors.grey[300],
                                    filled: true,
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius:
                                            BorderRadius.circular(10.0))),
                              ),
                              const SizedBox(
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
                                    prefixIcon: const Icon(
                                      Icons.vpn_key,
                                      color: kPrimaryColor,
                                    ),
                                    contentPadding:
                                        const EdgeInsets.only(left: 30),
                                    hintText: ' Password',
                                    fillColor: Colors.grey[300],
                                    filled: true,
                                    errorBorder: const OutlineInputBorder(
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
                              FirebaseAuth.instance.currentUser!
                                  .sendEmailVerification();
                              if (credential.user!.emailVerified) {
                               
      
                                Navigator.pushNamed(context, "/homeadmin");
                              } else {
                                
                                AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.warning,
                                        animType: AnimType.rightSlide,
                                        title: 'Warning',
                                        titleTextStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                        desc: 'Please verify your email.',
                                        descTextStyle: TextStyle(fontSize: 17))
                                    .show();
                              }
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                AwesomeDialog(
                                        context: context,
                                        dialogType: DialogType.error,
                                        animType: AnimType.rightSlide,
                                        title: 'Error',
                                        titleTextStyle: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22),
                                        desc:
                                            'The password provided is too weak.',
                                        descTextStyle: TextStyle(fontSize: 17))
                                    .show();
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
      ),
    );
  }
}
