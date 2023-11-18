import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class SettingsAdmin extends StatelessWidget {
  const SettingsAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text('Settings' ,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,color: Colors.white)),
        centerTitle: true,
        leading: Icon(Icons.arrow_back),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              children: [
                Icon(Icons.notifications),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 5,
                    height: 5,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: kPrimaryColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  right: 20,
                  child: Container(
                    // width: MediaQuery.of(context).size.width*0.8,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 5.0)),
                        ]),
                    child: SizedBox(
                      height: 60,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Hello, Admin',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Color.fromRGBO(51, 110, 131, 1)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          // Text(
                          //   '+91 9876543210',
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.w500,
                          //       fontSize: 16,
                          //       color: Color(0xff065e54)),
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Electroinc Attendance Department",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color:kPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.4,
                  // right: 130,
                  // left: 130,
                  top: 0,
                  child: CircleAvatar(
                    backgroundImage:AssetImage('assets/images/blank-profile-picture-973460_1280.png'),
                    radius: 40,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10),
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "General",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromRGBO(51, 110, 131, 1),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return cards(context, index);
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * .95,
                    height: 60,
                    decoration: BoxDecoration(
                        color: kPrimaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                        child: Text(
                      "LOG OUT",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white),
                    )),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cards(BuildContext context, int index) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(bottom: 14),
        width: MediaQuery.of(context).size.width * .95,
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200, spreadRadius: 1, blurRadius: 1)
            ]),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: data[index].iconBgColor,
            ),
            child: Icon(
              data[index].icon,
              color: data[index].iconColor,
            ),
          ),
          title: Text(
            data[index].label,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          trailing: data[index].trailing,
        ),
      ),
    );
  }
}

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
  Data(
      label: "Language Setup",
      trailing: Switch(
        thumbColor: MaterialStatePropertyAll(kPrimaryColor),
        activeTrackColor:kPrimaryColor,
        inactiveTrackColor: Color(0xffadf7c4),
        onChanged: (e) {

        },
        value: true,
      ),
      iconBgColor: Color(0xffadf7c4),
      icon: Icons.g_translate,
    iconColor: Colors.green
  ),
  Data(
      label: "Change Password",
      trailing: Icon(Icons.arrow_forward_ios, size: 15,),
      iconBgColor: Color(0xffeaaafa),
      icon:Icons.lock,
    iconColor: Colors.deepPurple
  ),
  Data(
      label: "Privacy Policy",
      trailing: Icon(Icons.arrow_forward_ios, size: 15,),
      iconBgColor: Color(0xfffacc91),
      icon:Icons.verified_user,
     iconColor: Colors.orange
  ),
  Data(
      label: "Terms and Conditions",
      trailing: Icon(Icons.arrow_forward_ios, size: 15,),
      iconBgColor: Color(0xffff8f9c),
      icon:Icons.description,
    iconColor: Colors.red
  )
];