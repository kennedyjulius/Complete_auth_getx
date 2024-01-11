import 'package:flutter/material.dart';

Color primarycolor = Colors.redAccent;
Color backgroundcolor = Colors.grey.shade700.withOpacity(0.3);
Color buttoncolor = Colors.grey;
Color secondarycolor = Colors.blue;

List<BoxShadow> customShadow = [
  BoxShadow(
    blurRadius: 10,
    color: Colors.black.withOpacity(0.4),
    offset: Offset(0.4, 0.3),
    spreadRadius: 5,
  ),

  BoxShadow(
    blurRadius: 10,
    color: Colors.white12.withOpacity(0.4),
    offset: Offset(0.2, 0.3),
    spreadRadius: 5,
  ),
];
