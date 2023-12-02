import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'add_professor_form.dart';
 class ListOfTeacherPageInAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('List of added Teachers',style: TextStyle(fontSize: 20),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
          
            Expanded(
              child: ListView(
                children: [
                  buildStudentContainer('Mohammad Awad', ' 1955276512', Colors.white, kPrimaryColor, Icons.account_circle_rounded, kPrimaryColor),
                  buildStudentContainer('Mohammad Maree', ' 1665276512', Colors.white, kPrimaryColor, Icons.account_circle_rounded, kPrimaryColor),
                  buildStudentContainer('Mujahed Eleyat', ' 1955888512', Colors.white, kPrimaryColor, Icons.account_circle_rounded,kPrimaryColor),
                  buildStudentContainer('Sami Awad', ' 3395276512',  Colors.white, kPrimaryColor, Icons.account_circle_rounded, kPrimaryColor),
                  buildStudentContainer('Osama Salameh', ' 1955276999', Colors.white, kPrimaryColor, Icons.account_circle_rounded, kPrimaryColor),
                  buildStudentContainer('Tariq zanoon', ' 1955271112',  Colors.white, kPrimaryColor, Icons.account_circle_rounded, kPrimaryColor),
                  buildStudentContainer('Ala Hamarsheh', ' 1955996512', Colors.white, kPrimaryColor, Icons.account_circle_rounded, kPrimaryColor),
                  buildStudentContainer('Mahmoud Obaid', ' 19589896512', Colors.white, kPrimaryColor, Icons.account_circle_rounded, kPrimaryColor),
                ],
              ),
            ),
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
        child: Icon(Icons.add),
      ),
    );
  }

  Widget buildStudentContainer(String name, String subtitle, Color containerColor, Color textColor, IconData icon, Color iconColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: containerColor,
      ),
      child: ListTile(
        title: Text(name, style: TextStyle(color: textColor,fontSize: 20)),
        subtitle: Text(subtitle, style: TextStyle(color: textColor,fontSize: 20)),
        trailing: Icon(Icons.arrow_forward_ios, color: iconColor),
         leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(AssetsData.profilepic),
                    // Replace with actual image path
                  ),
        // Icon(
        //   icon,
        //   size: 40,
        //   color: iconColor,
        
        // onTap: () {
        //   print('onTap Pressed');
        // },
        // onLongPress: () {
        //   print('onLong Pressed!');
        // },
        iconColor: iconColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}