import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class RecentlyAddTeachers extends StatelessWidget {
  const RecentlyAddTeachers({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text("Recently added teacher",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 22,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            width: 90,
          ),
          Text("see all",
              style: TextStyle(
                  color: Color.fromARGB(255, 149, 149, 149), fontSize: 19))
        ],
      ),
      SizedBox(
        height: 30,
      ),
      SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Container(
                width: 220,
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Material(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                               SizedBox(
                          width: double.infinity,
                          height: 130, // Set the desired height
                          child:
                          Image.asset(
                            AssetsData.profMoh,
                            fit: BoxFit.cover,
                           // width: double.infinity,
                         //   height: 90,
                          ),

                               ),
                          SizedBox(
                             width: double.infinity,
                             height: 90, 
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Mohammad Awad",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                  ),
                                  Text(
                                    '200710000',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                        )
                        )
                        )
                        ),
            SizedBox(
              width: 30,
            ),
            Container(
                width: 220,
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Material(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                               SizedBox(
                          width: double.infinity,
                          height: 130, // Set the desired height
                          child:
                          Image.asset(
                            AssetsData. drosama,
                            fit: BoxFit.cover,
                           // width: double.infinity,
                         //   height: 90,
                          ),

                               ),
                          SizedBox(
                             width: double.infinity,
                             height: 90, 
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    "Osama Salameh",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5),
                                  ),
                                  Text(
                                    '201010000',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ]
                        )
                        )
                        )
                        ),
                        SizedBox(width: 20,)
          ])
          )
    ]);
  }
}
