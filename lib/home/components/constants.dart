import 'package:flutter/material.dart';

Paint areaPaint = Paint()
  ..strokeCap = StrokeCap.round
  ..isAntiAlias = true
  ..color = Colors.black
  ..strokeWidth = 5.0;

BorderRadius borderRadiusCircular20 = BorderRadius.all(
  Radius.circular(20.0),
);

BoxShadow canvasBoxShadow = BoxShadow(
  color: Colors.black.withOpacity(0.4),
  blurRadius: 5.0,
  spreadRadius: 1,
);
