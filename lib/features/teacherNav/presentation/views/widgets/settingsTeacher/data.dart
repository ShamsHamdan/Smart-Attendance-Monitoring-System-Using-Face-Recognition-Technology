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
  //       thumbColor:const MaterialStatePropertyAll(kPrimaryColor),
  //       activeTrackColor:Colors.grey[100],
  //      // inactiveTrackColor:Color.fromARGB(255, 30, 131, 62),
  //       onChanged: (e) {

  //       },
  //       value: true,
  //     ),
  //     iconBgColor:const Color.fromRGBO(255, 162, 156, 1),
  //     icon: Icons.language,
  //   iconColor:const Color.fromRGBO(215, 76, 66, 1)
  // ),
  Data(
      label: "Edit Profile",
      trailing:const Icon(Icons.arrow_forward_ios, size: 15,),
      iconBgColor:const Color.fromRGBO(234, 234, 87, 1),
      icon:Icons.account_circle,
     iconColor:const Color.fromRGBO(153, 153, 3, 1)
  ),
  Data(
      label: "Change Password",
      trailing:const Icon(Icons.arrow_forward_ios, size: 15,),
      iconBgColor:const Color.fromRGBO(247, 192, 217, 1),
      icon:Icons.vpn_key,
    iconColor:const Color.fromRGBO(76, 72, 197, 1)
  ),
  Data(
      label: "Terms and Conditions",
      trailing: Icon(Icons.arrow_forward_ios, size: 15,),
     iconBgColor:const Color.fromRGBO(255, 162, 156, 1),
      icon:Icons.description,
    iconColor:const Color.fromRGBO(215, 76, 66, 1)
  ),
  Data(
      label: "Privacy Policy",
      trailing:const Icon(Icons.arrow_forward_ios, size: 15,),
      iconBgColor:const Color.fromRGBO(255, 226, 138, 1),
      icon:Icons.security,
    iconColor: const Color.fromRGBO(238, 178, 0, 1)
  )
];