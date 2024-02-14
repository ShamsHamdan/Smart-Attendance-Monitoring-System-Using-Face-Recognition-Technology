// import 'package:first_version/constants.dart';
// import 'package:flutter/material.dart';

// class ResBodyHeader extends StatefulWidget {
//   const ResBodyHeader({super.key});

//   @override
//   State<ResBodyHeader> createState() => _ResBodyHeaderState();
// }

// class _ResBodyHeaderState extends State<ResBodyHeader> {
//   @override
//   Widget build(BuildContext context) {
//     return  SizedBox(
//             height: 270,
//             child: Stack(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: 210,
//                   decoration: const BoxDecoration(
//                       color: kPrimaryColor,
//                       borderRadius: BorderRadius.only(
//                           bottomRight: Radius.circular(30),
//                           bottomLeft: Radius.circular(30))),
//                 ),
//                 const Positioned(
//                   top: 0,
//                   left: 155,
//                   child: Text('Results',
//                       style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 30,
//                           color: Colors.white)),
//                 ),
//                 Positioned(
//                   top: 90,
//                   left: 20,
//                   right: 20,
//                   child: Container(
//                     height: 150,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(30),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey.shade300,
//                               blurRadius: 5,
//                               spreadRadius: 1,
//                               offset: const Offset(0, 5.0)),
//                         ]),
//                     child: const Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         SizedBox(
//                           width: 25,
//                         ),
//                         Column(
//                           children: [
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Icon(
//                               Icons.person,
//                               size: 37,
//                               color: kPrimaryColor,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "15",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "All",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           width: 55,
//                         ),
//                         Column(
//                           children: [
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Icon(
//                               Icons.check,
//                               size: 37,
//                               color: Colors.green,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "10",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "Attendess",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                         SizedBox(
//                           width: 40,
//                         ),
//                         Column(
//                           children: [
//                             SizedBox(
//                               height: 20,
//                             ),
//                             // Text(
//                             //   "X",
//                             //   style: TextStyle(
//                             //       fontSize: 30,
//                             //       color: Colors.red,
//                             //       fontWeight: FontWeight.bold),
//                             // ),
//                             Icon(
//                               Icons.close,
//                               size: 37,
//                               color: Colors.red,
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "5",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Text(
//                               "Absentees",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           );
//   }
// }