import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class nameTeach extends StatefulWidget {
  const nameTeach({super.key});

  @override
  State<nameTeach> createState() => _nameTeachState();
}

class _nameTeachState extends State<nameTeach> {
  DocumentSnapshot? data4;
  var dho = "iM8b3g7bNwZDaLh7490f";
  String? name;
  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    DocumentSnapshot data4 = querySnapshot.docs[0];
    name = data4['name'];
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  
  }
//h
  @override
  Widget build(BuildContext context) {
    return Text(
      "${name}",
      style: TextStyle(
          fontSize: 35,
          // fontFamily: "Verdana",
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 0, 0, 0)),
    );
  }
}
