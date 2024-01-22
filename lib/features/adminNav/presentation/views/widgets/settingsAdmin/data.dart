import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';

class Data {
  final String label;
  final Widget trailing;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;


  Data(
      {required this.label,
      required this.trailing,
      required this.icon,
      required this.iconBgColor,
        required this.iconColor
      });
}

List<Data> data = [
  // Data(
  //     label: "Language Setup",
  //     trailing: Switch(
  //      thumbColor:const MaterialStatePropertyAll(kPrimaryColor),
  //       activeTrackColor:Color.fromARGB(255, 226, 221, 221),
  //       inactiveTrackColor: Color.fromARGB(255, 157, 159, 158),
  //       onChanged: (e) {

  //       },
  //       value: true,
  //     ),
  //     iconBgColor: Color.fromRGBO(186, 255, 136, 1),
  //     icon: Icons.g_translate,
  //   iconColor: Color.fromRGBO(100, 212, 20, 1)
  // ),

  Data(
      label: "Edit Profile",
      trailing: Icon(Icons.arrow_forward_ios, size: 15,),
      iconBgColor: Color.fromRGBO(250, 242, 160, 1),
      icon:Icons.edit,
     iconColor: Color.fromRGBO(217, 185, 41, 1)
  ),  Data(
      label: "Change Password",
      trailing: Icon(Icons.arrow_forward_ios, size: 15,),
      iconBgColor: Color(0xffeaaafa),
      icon:Icons.lock,
    iconColor: const Color.fromARGB(255, 112, 67, 188)
  ),
   Data(
      label: "Privacy Policy",
      trailing:const Icon(Icons.arrow_forward_ios, size: 15,),
     iconBgColor: Color.fromRGBO(186, 255, 136, 1),
      icon:Icons.security,
    iconColor: Color.fromRGBO(100, 212, 20, 1)
  ),
  Data(
      label: "Terms and Conditions",
      trailing: Icon(Icons.arrow_forward_ios, size: 15,),
      iconBgColor: Color.fromARGB(255, 244, 186, 193),
      icon:Icons.description,
    iconColor: Color.fromRGBO(128, 45, 49, 1)
  )
];