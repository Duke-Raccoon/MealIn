

import 'package:flutter/material.dart';

class CustomClipperPath extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path=Path();
    path.lineTo(0, 500);
    //path.quadraticBezierTo(size.width*0.5, size.height, size.width, size.height*0.8);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip( CustomClipper<Path> oldClipper) {
    return false;
  }
}