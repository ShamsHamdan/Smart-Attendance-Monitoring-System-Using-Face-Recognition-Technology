import 'package:first_version/constants.dart';
import 'package:first_version/features/adminNav/presentation/views/widgets/teacherAdmin/list_of_departments.dart';
import 'package:flutter/material.dart';

class ListOfFacultiesAdmin extends StatelessWidget {
  const ListOfFacultiesAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('List of Faculties',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 20,
          ),
          ListOfFaculties(
            collegeName: 'Faculty of Engineering',
            subTitle:'',// 'and Information Technology',
            url: 'assets/images/eng.jpeg',
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
            collegeName: 'Faculty of Information ',
            subTitle:'Technology',// 'and Information Technology',
            url: 'assets/images/img4267.jpg',
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
            url: 'assets/images/fin.jpeg',
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
            collegeName: 'Faculty of Allied',
            subTitle: ' Medical Sciences',
            url: 'assets/images/med.jpg',
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
            collegeName: 'Faculty of Sports',
            subTitle: 'Sciences',
            url: 'assets/images/Sport.jpg',
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
            collegeName: 'Faculty of Dentistry',
            subTitle: '',
            url: 'assets/images/dentistry.jpg',
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
            collegeName: 'Faculty of Medicine',
            subTitle: '',
            url: 'assets/images/Medicine.jpg',
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
            collegeName: 'Faculty of Nursing',
            subTitle: '',
            url: 'assets/images/nursing.jpg',
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
            collegeName: 'Faculty of Arts',
            subTitle: '',
            url: 'assets/images/art.jpeg',
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
            collegeName: 'Faculty of Law',
            subTitle: '',
            url: 'assets/images/law.jpg',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListOfDepartments(),
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
  final String? url;

  const ListOfFaculties({
    Key? key,
    required this.collegeName,
    required this.subTitle,
    this.onTap, this.url,
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
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black, width: .5),
                 // color: Colors.amber,
                  image: DecorationImage(
                    image: AssetImage(url ?? ''),
                    fit: BoxFit.cover,
                  ),
                ),
                // decoration: BoxDecoration(
                //   gradient: const LinearGradient(
                //     colors: [
                //       Color.fromRGBO(83, 157, 185, 1),
                // Colors.grey
                //     ],
                //   ),
                //   borderRadius: BorderRadius.circular(18),
                // ),
              ),
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, .7),
                  borderRadius: BorderRadius.circular(20),
                ),
                height: 180,
                width: 350,
              ),
            ),
            // Positioned(
            //   top: 0,
            //   right: 40,
            //   child: Container(
            //     height: 80,
            //     width: 80,
            //     decoration: const BoxDecoration(
            //       color: Colors.blue,
            //       shape: BoxShape.circle,
            //     ),
            //     child: const CircleAvatar(
            //       backgroundImage: AssetImage('assets/images/university (6).png'),
            //       radius: 30,
            //     ),
            //   ),
            // ),
            Positioned(
              top: 100,
              left: 90,
              child: Text(
                collegeName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Positioned(
              top: 125,
              left: 90,
              child: Text(
                subTitle,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
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










