import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'list_of_specialties_TeacherAdmin.dart';

class TeacherAdmin extends StatefulWidget {
  const TeacherAdmin({Key? key}) : super(key: key);

  @override
  State<TeacherAdmin> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<TeacherAdmin> {
  List<String> facultyList = [
    'Faculty of Engineering',
    'Faculty of Information Technology',
    'Faculty of Administrative and Financial Sciences',
    'Faculty of Allied Medical Sciences',
    'Faculty of Sports Sciences',
    'Faculty of Arts',
    'Faculty of Law',
    'Faculty of Nursing',
    'Faculty of Medicine',
    'Faculty of Dentistry',
  ];

  String filter = '';

  @override
  Widget build(BuildContext context) {
    List<String> filteredList = facultyList
        .where(
            (faculty) => faculty.toLowerCase().contains(filter.toLowerCase()))
        .toList();

    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title: Text(
                    'List of Academic Faculty',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(AssetsData.logoforadminhome),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        filter = value;
                      });
                    },
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search Faculty',
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: kPrimaryColor,
              child: SingleChildScrollView(
                child: Container(
                  //color: Colors.grey[100],
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(245, 245, 245, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                    ),
                  ),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 30,
                    children: filteredList
                        .map((faculty) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ListOfSpecialtiesTeacher(),
                                  ),
                                );
                              },
                              child: itemDashboard(
                                context,
                                faculty,
                                'assets/images/school.jpeg',
                                Colors.blue,
                              ),
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemDashboard(
      BuildContext context, String title, String imagePath, Color background) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 5),
            color: Theme.of(context).primaryColor.withOpacity(.2),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Container(
              
             // color: background,
              child: Image.asset(
                imagePath,
                width: 60,
                height: 60,
              ),
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 40,
            child: Container(
              child: Text(
                title,
                style: const TextStyle(color: Colors.black, fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}