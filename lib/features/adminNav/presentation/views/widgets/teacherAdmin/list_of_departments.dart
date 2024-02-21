import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/TabNavAddTeacherandCourse.dart';
import 'package:flutter/material.dart';

class ListOfDepartments extends StatefulWidget {
  const ListOfDepartments({Key? key}) : super(key: key);

  @override
  State<ListOfDepartments> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ListOfDepartments> {
  List<String> facultyList = [
    'Computer Systems Engineering Department',
    'Electrical Engineering Department',
    'Biomedical Engineering Department',
    'Architecture Engineering Department',
    'Mechatronics Engineering Department',
    'Civil Engineering Department',
    'Telecommunications Engineering Department',
  ];

  String filter = '';

  @override
  Widget build(BuildContext context) {
    List<String> filteredList = facultyList
        .where(
            (faculty) => faculty.toLowerCase().contains(filter.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  title: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          size: 25,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'List of Departments',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  trailing: CircleAvatar(
                    radius: 37,
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
                      hintText: 'Search of department',
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromRGBO(245, 245, 245,
                                .8)), // Set the border color to white
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: const Color.fromRGBO(245, 245, 245,
                                .8)), // Set the border color to white
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
              color: Colors.grey[100],
              child: SingleChildScrollView(
                child: Container(
                  //color: Colors.grey[100],
                  padding: const EdgeInsets.symmetric(horizontal:23),
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
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 40,
                    children: filteredList
                        .map((faculty) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddTeacherandCourseInAdminTabNav(
                                      initialIndex: 0,
                                    ),
                                  ),
                                );
                                // Navigator.pushNamed(
                                //   context,
                                //   "/addNavInAdmin"
                                // );
                              },
                              child: itemDashboard(
                                context,
                                faculty,
                                'assets/images/school-removebg-preview.png',
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
        color: Color.fromARGB(255, 255, 255, 255),
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
          SizedBox(height: 5,),
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
            height: 80,
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




