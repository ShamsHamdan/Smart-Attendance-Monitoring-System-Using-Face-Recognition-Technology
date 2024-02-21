import 'package:first_version/constants.dart';
import 'package:first_version/core/utils/assets.dart';
import 'package:flutter/material.dart';

class ImageHeader extends StatefulWidget {
  final String imgSrc;
  const ImageHeader({
    Key? key,
    required this.imgSrc,
  }) : super(key: key);

  @override
  State<ImageHeader> createState() => _ImageHeaderState();
}

class _ImageHeaderState extends State<ImageHeader> {
  @override
  Widget build(BuildContext context) {
    String imagePath = widget.imgSrc;
    Size size = MediaQuery.of(context).size;
    return imagePath != null && imagePath!.isNotEmpty
        ? Image.network(
            Uri.parse(imagePath!).toString(), height: size.height * 0.28,
            width: double.infinity,
            // it cover the 25% of total height
            fit: BoxFit.fill,
          )
        : Image.asset(AssetsData.imageAddCourseDef);

    
  }
}
