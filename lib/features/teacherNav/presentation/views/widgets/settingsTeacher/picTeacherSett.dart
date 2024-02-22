import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class PicTeacherSettening extends StatefulWidget {
  const PicTeacherSettening({super.key});

  @override
  State<PicTeacherSettening> createState() => _PicAdminSetteningState();
}

class _PicAdminSetteningState extends State<PicTeacherSettening> {
  String? url;
  DocumentSnapshot? data1;

  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("idFire", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    DocumentSnapshot data1 = querySnapshot.docs[0];
    Map<String, dynamic>? data = data1.data() as Map<String, dynamic>?;
    if (data != null && data.containsKey('url')) {
      setState(() {
        print(data);
        url = data['url'];
        print("****************************************$url");
      });
    } else {
      setState(() {
        url = null;
      });
      // Handle the case when 'url' field is not found
      // setState(() {
      //   // Set the fallback image from the assets
      //   url = 'assets/images/blank-profile-picture.png';
      print("----------------------$url");
      // });
    }
  }
  

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: url != null && url!.isNotEmpty
          ? NetworkImage(Uri.parse(url!).toString())
          : AssetImage(AssetsData.profilepic) as ImageProvider<Object>,
      radius: 60,
    );
  }
}
