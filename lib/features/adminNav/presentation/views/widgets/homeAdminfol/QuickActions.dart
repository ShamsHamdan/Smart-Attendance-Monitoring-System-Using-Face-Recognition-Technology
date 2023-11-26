import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';

class  QuickActions extends StatelessWidget {
  
  const  QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xFFE4E7EC),
                      width: 2,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    radius: 30,
                    child: Icon(
                      Icons.person_outline,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                const Text(
                  "Add Teacher",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xFFE4E7EC),
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    radius: 30,
                    child: Icon(
                      Icons.library_books_outlined,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                Text(
                  "Add Course ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Color(0xFFE4E7EC),
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
                    radius: 30,
                    child: Icon(
                      Icons.bar_chart,
                      color: kPrimaryColor,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                const Text(
                  "Statistics",
                  style: TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 17,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}