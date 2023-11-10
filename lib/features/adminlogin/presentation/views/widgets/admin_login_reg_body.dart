import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class adminLoginRegstrationBody extends StatefulWidget  {
  const adminLoginRegstrationBody({super.key});

  @override
  State<adminLoginRegstrationBody> createState() => _adminLoginRegstrationBodyState();
}

class _adminLoginRegstrationBodyState extends State<adminLoginRegstrationBody> with SingleTickerProviderStateMixin  {

    late PageController _pageController;

  Color left = Colors.black;
  Color right = Colors.white;

  @override
  void dispose() {
    _pageController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   body: SingleChildScrollView(
      // physics: const ClampingScrollPhysics(),
      // child: GestureDetector(
      //   onTap: () {
      //     FocusScope.of(context).requestFocus(FocusNode());
      //   },
      //   child: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 25),
      //   child:
      //       Column(
      //         mainAxisAlignment: MainAxisAlignment.end,
      //          children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.only(bottom: 2),
      //       child: Image.asset(AssetsData.logowhitesmall),
      //     ),
      //     Padding(
      //         padding: const EdgeInsets.only(bottom: 43),
      //       child: Center(
              
      //         child: Text("Attendance System",style: TextStyle(
      //                 fontSize: 23,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.white,
      //               ),),
      //       ),
      //     ),
      //     Container(
      //       height: 510,
      //       width: double.infinity,
      //       decoration: BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.only(
      //               topLeft: Radius.circular(90),
      //               bottomRight: Radius.circular(90))),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: <Widget>[
      //           Text(
      //             "Login",
      //             style: TextStyle(
      //               fontSize: 30,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 30),
      //             child: Column(
      //               children: <Widget>[
      //                 TextFormField(
      //                   decoration: InputDecoration(
      //                       prefixIcon: Icon(
      //                         Icons.person,
      //                         color: kPrimaryColor,
      //                       ),
      //                       contentPadding: EdgeInsets.only(left: 30),
      //                       hintText: 'User Email',
      //                       fillColor: Colors.grey[300],
      //                       filled: true,
      //                       border: OutlineInputBorder(
      //                           borderSide: BorderSide.none,
      //                           borderRadius: BorderRadius.circular(10.0))),
      //                 ),
      //                 SizedBox(
      //                   height: 20,
      //                 ),
      //                 TextFormField(
      //                   decoration: InputDecoration(
      //                       prefixIcon: Icon(
      //                         Icons.vpn_key,
      //                         color: kPrimaryColor,
      //                       ),
      //                       contentPadding: EdgeInsets.only(left: 30),
      //                       hintText: ' Password',
      //                       fillColor: Colors.grey[300],
      //                       filled: true,
      //                       border: OutlineInputBorder(
      //                           borderSide: BorderSide.none,
      //                           borderRadius: BorderRadius.circular(15.0))),
      //                 ),
      //               ],
      //             ),
      //           ),
               
      //           ElevatedButton(
      //             onPressed: () {},
      //             style: ButtonStyle(
      //               backgroundColor: MaterialStateProperty.all(kPrimaryColor),
      //               padding: MaterialStateProperty.all(
      //                   EdgeInsets.symmetric(horizontal: 106, vertical: 10)),
      //               shape: MaterialStateProperty.all(RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(27))),
      //             ),
      //             child: Text(
      //               "login",
      //               style: TextStyle(fontSize: 24),
      //             ),
      //           ),
      //         ],
      //       ),
      //     )
      //   ]),
      // ),
      // )
      // ),
    );
  }
}