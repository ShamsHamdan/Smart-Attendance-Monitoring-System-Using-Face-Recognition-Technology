 import 'package:first_version/constants.dart';
import 'package:flutter/material.dart';




class StudentNumber extends StatelessWidget {
  final int number;
  const StudentNumber ({
    Key? key,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          Text("Students",style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
//
          ),),
          studentNumTag(context, number: number),
        ],
      ),
    );
  }
}






ClipPath studentNumTag(BuildContext context, {required int number}) {
    return ClipPath(
      clipper: PricerCliper(),
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(vertical: 15),
        height: 60,
        width: 65,
        color: kPrimaryColor,
        child: Text(
          "$number",style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }


class PricerCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double ignoreHeight = 20;
    path.lineTo(0, size.height - ignoreHeight);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - ignoreHeight);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}