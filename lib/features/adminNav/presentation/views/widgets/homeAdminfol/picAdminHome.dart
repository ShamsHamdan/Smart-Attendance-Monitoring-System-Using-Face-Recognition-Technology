import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class PicAdminHome extends StatefulWidget {
  const PicAdminHome({super.key});

  @override
  State<PicAdminHome> createState() => _PicAdminHomeState();
}

class _PicAdminHomeState extends State<PicAdminHome> {
  String? url;
  DocumentSnapshot? data1;

  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Admins')
        .where("id", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
  // DocumentSnapshot data1 = querySnapshot.docs[0];
  // setState(() {
  //   url = data1['url'];
  // });

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
      radius: 30,
    );
  }
}
