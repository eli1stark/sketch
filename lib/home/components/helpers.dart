import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sketch/models/drawing_area.dart';

/// convert list of bytes into image file
Future<File> writeBytes(listBytes) async {
  // get App Directory Path
  final directory = await getApplicationDocumentsDirectory();

  // create image file
  final file = File('${directory.path}/image.png');

  // write bytes into image file
  return file.writeAsBytes(
    listBytes,
    flush: true,
  );
}

void processPoints(
  List<DrawingArea> points,
  PictureRecorder recorder,
) {
  final canvas = Canvas(
    recorder,
    Rect.fromPoints(
      Offset(0.0, 0.0),
      Offset(200.0, 200.0),
    ),
  );

  Paint paint = Paint()
    ..color = Colors.black
    ..strokeCap = StrokeCap.round
    ..strokeWidth = 5.0;

  final paint2 = Paint()
    ..style = PaintingStyle.fill
    ..color = Colors.white;

  canvas.drawRect(
    Rect.fromLTWH(0, 0, 256, 256),
    paint2,
  );

  for (int i = 0; i < points.length - 1; i++) {
    if (points[i] != null && points[i + 1] != null) {
      canvas.drawLine(
        points[i].point,
        points[i + 1].point,
        paint,
      );
    }
  }
}
