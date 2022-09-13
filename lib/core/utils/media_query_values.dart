import 'package:flutter/material.dart';

extension MediaQueryVaues on BuildContext{
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get topPadding => MediaQuery.of(this).viewPadding.left;
  double get bottomPadding => MediaQuery.of(this).viewPadding.bottom;
}