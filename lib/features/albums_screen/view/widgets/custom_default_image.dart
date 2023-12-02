import 'package:flutter/material.dart';

class CustomDefaultImage extends StatelessWidget {
  CustomDefaultImage(
      {Key? key,
      required this.height,
      required this.width,
      required this.image,
      this.onTap})
      : super(key: key);
  final double width;
  final double height;
  GestureTapCallback? onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        image,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
