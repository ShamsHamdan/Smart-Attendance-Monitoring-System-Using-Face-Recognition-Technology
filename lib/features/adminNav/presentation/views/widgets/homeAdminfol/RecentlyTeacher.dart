// import 'package:first_version/core/utils/assets.dart';
// import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_teacheres_Admin.dart';
// import 'package:flutter/material.dart';

// class RecentlyAddTeachers extends StatelessWidget {
//   const RecentlyAddTeachers({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(children: [
//       Row(
//         children: [
//           SizedBox(
//             width: 20,
//           ),
//           Text("Recently added teacher",
//               style: TextStyle(
//                   color: Color.fromARGB(255, 0, 0, 0),
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold)),
//           // SizedBox(
//           //   width: 90,
//           // ),
//           // GestureDetector(
//           //   onTap: () {
//           //       Navigator.push(context, MaterialPageRoute(builder: (context) =>ListOfTeacherPageInAdmin()));
//           //       //Navigator.pushNamed(context, "/maintabcoursesinteacher");
//           //   },
//           //   child: Text("see all",
//           //       style: TextStyle(
//           //           color: Color.fromARGB(255, 149, 149, 149), fontSize: 19)),
//           // )
//           // Text("see all",
//           //     style: TextStyle(
//           //         color: Color.fromARGB(255, 149, 149, 149), fontSize: 19))
//         ],
//       ),
//       SizedBox(
//         height: 30,
//       ),
//       SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(children: <Widget>[
//             SizedBox(
//               width: 20,
//             ),
//             Container(
//                 width: 220,
//                 margin: EdgeInsets.only(bottom: 15),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.white,
//                       offset: Offset(0, 0),
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Material(
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                                SizedBox(
//                           width: double.infinity,
//                           height: 130, // Set the desired height
//                           child:
//                           Image.asset(
//                             AssetsData.profMoh,
//                             fit: BoxFit.cover,
//                            // width: double.infinity,
//                          //   height: 90,
//                           ),

//                                ),
//                           SizedBox(
//                              width: double.infinity,
//                              height: 107, 
//                             child: Container(
//                               padding: EdgeInsets.all(15),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     "Mohammad Awad",
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   Text(
//                                   'EIT',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold
//                                   ),
//                                 ),
//                                   Text(
//                                     '200710000',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ]
//                         )
//                         )
//                         )
//                         ),
//             SizedBox(
//               width: 30,
//             ),
//             Container(
//                 width: 220,
//                 margin: EdgeInsets.only(bottom: 15),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.white,
//                       offset: Offset(0, 0),
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Material(
//                         child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: <Widget>[
//                                SizedBox(
//                           width: double.infinity,
//                           height: 130, // Set the desired height
//                           child:
//                           Image.asset(
//                             AssetsData. drosama,
//                             fit: BoxFit.cover,
//                            // width: double.infinity,
//                          //   height: 90,
//                           ),

//                                ),
//                           SizedBox(
//                              width: double.infinity,
//                              height: 107, 
//                             child: Container(
//                               padding: EdgeInsets.all(15),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: <Widget>[
//                                   Text(
//                                     "Osama Salameh",
//                                     style: TextStyle(
//                                       fontSize: 20,
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   // 
//                                    Text(
//                                   'EIT',
//                                   style: TextStyle(
//                                     fontSize: 17,
//                                     color: Colors.black,
//                                     fontWeight: FontWeight.bold
//                                   ),
//                                 ),
//                                   Text(
//                                     '201010000',
//                                     style: TextStyle(
//                                       fontSize: 17,
//                                       color: Colors.grey,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ]
//                         )
//                         )
//                         )
//                         ),
//                         SizedBox(width: 20,)
//           ])
//           )
//     ]);
//   }
// }



import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecentlyAddTeachers extends StatefulWidget {
  const RecentlyAddTeachers({super.key});

  @override
  _RecentlyAddTeachersState createState() => _RecentlyAddTeachersState();
}

class _RecentlyAddTeachersState extends State<RecentlyAddTeachers> {
  List<QueryDocumentSnapshot> data = [];
   bool isLoading = false;

  Future getData() async {
     setState(() {
       isLoading = true;
    });
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('Teachers')
        .where("Admin", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        // .orderBy(FieldPath.documentId,descending: false)
        // .limit(2)
        .get();
    data.addAll(querySnapshot.docs);
    
    setState(() {
       isLoading = false;
    });
  }


 
 @override
  void initState() {
    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              "Recently Added Teachers",
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Align(
           alignment: data.length == 1 ? Alignment.centerLeft : Alignment.center,
          child:isLoading
            ? CircularProgressIndicator() // Show loading indicator
            :
           SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: data.map((teacherDoc) {
                final imageUrl = teacherDoc['url'];
                return Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Container(
                    width: 220,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(0, 0),
                          blurRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Material(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              width: double.infinity,
                              height: 130,
                              child: imageUrl.isNotEmpty
                                  ? Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                      scale: 1.0,
                                    )
                                  : Image.asset(
                                      AssetsData.teacherDef, // Default image asset
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            SizedBox(
                              width: double.infinity,
                              height: 107,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      teacherDoc['name'],
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                   "EIT",
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      teacherDoc['id'],
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

