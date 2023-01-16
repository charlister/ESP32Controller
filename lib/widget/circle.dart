import 'package:flutter/material.dart';

class Circle {
  static Container circle(double width, double height, Color color) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,

      ),
    );
  }
}
