
import 'package:first_version/constants.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_departments.dart';
import 'package:flutter/material.dart';


class ListOfFacultiesAdmin extends StatelessWidget {
  const ListOfFacultiesAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('List of Faculties', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22)),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
        ListOfFaculties(
            collegeName: 'Faculty of Engineering',
            subTitle: 'and Information Technology',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListOfDepartments(),
                ),
              );
            },
          ),
        ListOfFaculties(
            collegeName: 'Faculty of Administrative',
            subTitle: 'and Financial Sciences',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const  ListOfDepartments(),
                ),
              );
            },
          ),
           ListOfFaculties(
            collegeName: 'Faculty of Allied Medical',
            subTitle: 'Sciences',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListOfDepartments(),
                ),
              );
            },
          ),
           ListOfFaculties(
            collegeName: 'Faculty of Sports Sciences',
            subTitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const  ListOfDepartments(),
                ),
              );
            },
          ),
          ListOfFaculties(
            collegeName: 'Faculty of Dentistry',
            subTitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const  ListOfDepartments(),
                ),
              );
            },
          ),
          ListOfFaculties(
            collegeName: 'Faculty of Medicine',
            subTitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const  ListOfDepartments(),
                ),
              );
            },
          ),
        ListOfFaculties(
            collegeName: 'Faculty of Nursing',
            subTitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const  ListOfDepartments(),
                ),
              );
            },
          ),
        ListOfFaculties(
            collegeName: 'Faculty of Arts',
            subTitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const  ListOfDepartments(),
                ),
              );
            },
          ),
         ListOfFaculties(
            collegeName: 'Faculty of Law' ,
            subTitle: '',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const  ListOfDepartments(),
                ),
              );
            },
          ),
          // Add more CollegeWidget instances as needed
        ],
      ),
    );
  }
}
 
 
class ListOfFaculties extends StatelessWidget {
  final String collegeName;
  final String subTitle;
  final VoidCallback? onTap;

  const ListOfFaculties({
    Key? key,
    required this.collegeName,
    required this.subTitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 250,
        width: 350,
        child: Stack(
          children: [
            Center(
              child: Container(
                height: 180,
                width: 350,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromRGBO(83, 157, 185, 1),
                Colors.grey
                    ],
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 40,
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/graduation.jpeg'),
                  radius: 30,
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 100,
              child: Text(
                collegeName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              top: 125,
              left: 100,
              child: Text(
                subTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}












// import 'package:first_version/constants.dart';
// import 'package:first_version/core/utils/assets.dart';
// import 'package:flutter/material.dart';
// import 'list_of_specialties_TeacherAdmin.dart';

// class TeacherAdmin extends StatefulWidget {
//   const TeacherAdmin({Key? key}) : super(key: key);

//   @override
//   State<TeacherAdmin> createState() => _HomeScreenState();
// }
// class _HomeScreenState extends State<TeacherAdmin> {
//   List<String> facultyList = [
//     'Faculty of Engineering',
//     'Faculty of Information Technology',
//     'Faculty of Administrative and Financial Sciences',
//     'Faculty of Allied Medical Sciences',
//     'Faculty of Sports Sciences',
//     'Faculty of Arts',
//     'Faculty of Law',
//     'Faculty of Nursing',
//     'Faculty of Medicine',
//     'Faculty of Dentistry',
//   ];

//   String filter = '';

//   @override
//   Widget build(BuildContext context) {
//     List<String> filteredList = facultyList
//         .where(
//             (faculty) => faculty.toLowerCase().contains(filter.toLowerCase()))
//         .toList();

//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               color: kPrimaryColor,
//               borderRadius: const BorderRadius.only(
//                 bottomRight: Radius.circular(50),
//               ),
//             ),
//             child: Column(
//               children: [
//                 const SizedBox(height: 50),
//                 const ListTile(
//                   contentPadding: EdgeInsets.symmetric(horizontal: 30),
//                   title: Text(
//                     'List of Academic Faculty',
//                     style: TextStyle(color: Colors.white, fontSize: 22),
//                   ),
//                   trailing: CircleAvatar(
//                     radius: 30,
//                     backgroundImage: AssetImage(AssetsData.logoforadminhome),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: TextField(
//                     onChanged: (value) {
//                       setState(() {
//                         filter = value;
//                       });
//                     },
//                     style: const TextStyle(color: Colors.white),
//                     decoration: InputDecoration(
//                       hintText: 'Search Faculty',
//                       hintStyle: const TextStyle(color: Colors.white),
//                       prefixIcon: const Icon(Icons.search, color: Colors.white),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Container(
//               color: kPrimaryColor,
//               child: SingleChildScrollView(
//                 child: Container(
//                   //color: Colors.grey[100],
//                   padding: const EdgeInsets.symmetric(horizontal: 30),
//                   decoration: const BoxDecoration(
//                     color: Color.fromRGBO(245, 245, 245, 1),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(100),
//                     ),
//                   ),
//                   child: GridView.count(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 25,
//                     mainAxisSpacing: 30,
//                     children: filteredList
//                         .map((faculty) => GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => ListOfSpecialtiesTeacher(),
//                                   ),
//                                 );
//                               },
//                               child: itemDashboard(
//                                 context,
//                                 faculty,
//                                 'assets/images/school.jpeg',
//                                 Colors.blue,
//                               ),
//                             ))
//                         .toList(),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget itemDashboard(
//       BuildContext context, String title, String imagePath, Color background) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(10),
//         boxShadow: [
//           BoxShadow(
//             offset: const Offset(0, 5),
//             color: Theme.of(context).primaryColor.withOpacity(.2),
//             spreadRadius: 2,
//             blurRadius: 5,
//           ),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SizedBox(
//             width: double.infinity,
//             height: 60,
//             child: Container(
              
//              // color: background,
//               child: Image.asset(
//                 imagePath,
//                 width: 60,
//                 height: 60,
//               ),
//             ),
//           ),
//           const SizedBox(height: 12),
//           SizedBox(
//             height: 40,
//             child: Container(
//               child: Text(
//                 title,
//                 style: const TextStyle(color: Colors.black, fontSize: 17),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }