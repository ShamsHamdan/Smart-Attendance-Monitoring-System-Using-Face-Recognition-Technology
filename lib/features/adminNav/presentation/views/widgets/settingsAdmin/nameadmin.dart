import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class nameAdmin extends StatefulWidget {
  const nameAdmin({super.key});

  @override
  State<nameAdmin> createState() => _nameAdminState();
}

class _nameAdminState extends State<nameAdmin> {
  DocumentSnapshot? data4;
  var dho="iM8b3g7bNwZDaLh7490f";
String ? name;
  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Admins')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
  @override
  Widget build(BuildContext context) {
    return Text(
                          "${name}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color.fromRGBO(51, 110, 131, 1)),
                        );
  }
}