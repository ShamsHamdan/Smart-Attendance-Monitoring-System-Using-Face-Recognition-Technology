import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/editTeacher.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/listCoursesOfEachTeacher.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'add_professor_form.dart';

class ListOfTeacherPageInAdmin extends StatefulWidget {

  @override
  State<ListOfTeacherPageInAdmin> createState() =>
      _ListOfTeacherPageInAdminState();
}

class _ListOfTeacherPageInAdminState extends State<ListOfTeacherPageInAdmin> {
  List<QueryDocumentSnapshot> data = [];

  Future getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("Admin", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    data.addAll(querySnapshot.docs);
    // Map<String, dynamic>? data = data1.data() as Map<String, dynamic>?;
    setState(() {
     // print("${data[0]['name']}");
      // Adminemail = data['email'];
      // Adminpass = data['password'];
    });
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text(
          'List of added Teachers',
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                   return   InkWell(
                    onTap: () {
                       Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListofAddedCoursesForTeacher(categoryId:data[i].id)),
          );
                    },
                      onLongPress: () {
                          AwesomeDialog(
                            context: context,
                            dialogType: DialogType.question,
                            animType: AnimType.rightSlide,
                            btnCancelOnPress: () {
                                
                                  AwesomeDialog(
                                context: context,
                                dialogType: DialogType.warning,
                                animType: AnimType.rightSlide,
                                btnCancelOnPress: () {},
                                btnOkOnPress: () async {
                                  try {
                                    await FirebaseFirestore.instance
                                        .collection('Teachers')
                                        .doc(data[i].id) 
                                        .delete();
                                    AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.success,
                                            animType: AnimType.rightSlide,
                                            title: 'Success',
                                            titleTextStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22),
                                            desc:
                                                'Teacher deleted successfully.',
                                            descTextStyle:
                                                TextStyle(fontSize: 17))
                                        .show();
                                  } catch (error) {
                                    AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.error,
                                            animType: AnimType.rightSlide,
                                            title: 'Failed',
                                            titleTextStyle: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22),
                                            desc: 'Failed to delete teacher.',
                                            descTextStyle:
                                                TextStyle(fontSize: 17))
                                        .show();
                                  }
                                },
                                btnOkText: "Delete",
                                buttonsTextStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                btnCancelText: "Cancel",
                                title: 'Are you sure of deleting process?',
                                titleTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ).show();


































                            },
                            btnOkOnPress: () {
                                Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  EditProfessorForm(teacherDocId: data[i].id,)),
          );
                            },
                            btnOkText: "Update",
                            buttonsTextStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),
                            btnCancelText: "Delete",
                            title: 'Choose Action',
                            titleTextStyle: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ).show();
                        },
                     child: buildTeacherContainer(
                            data[i]["name"],
                            data[i]["id"],
                            Colors.white,
                            kPrimaryColor,
                            data[i]["url"],
                            kPrimaryColor),
                   );
                    })),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProfessorForm()),
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildTeacherContainer(String name, String subtitle,
      Color containerColor, Color textColor, String url, Color iconColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: containerColor,
      ),
      child: ListTile(
        title: Text(name,
            style: TextStyle(
                color: textColor, fontSize: 20, fontWeight: FontWeight.bold)),
        subtitle:
            Text(subtitle, style: TextStyle(color: textColor, fontSize: 19)),
        trailing: Icon(Icons.arrow_forward_ios, color: iconColor),
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: url != null && url!.isNotEmpty
              ? NetworkImage(Uri.parse(url!).toString())
              : AssetImage(AssetsData.profilepic) as ImageProvider<Object>,

        ),
        
        iconColor: iconColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
