import 'dart:io';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sketch/api/api.dart';
import '../models/drawing_area.dart';
import 'components/canvas_bar.dart';
import 'components/canvas_box.dart';
import 'components/constants.dart';
import 'components/helpers.dart';
import 'components/home_frame.dart';
import 'components/result.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget imageOutput;
  bool loading = false;
  List<DrawingArea> points = [];
  ByteData imageBytes = ByteData(1024);

  void processSketch(List<DrawingArea> points) async {
    final recorder = ui.PictureRecorder();

    processPoints(points, recorder);

    final picture = recorder.endRecording();

    final image = await picture.toImage(256, 256);

    final pngBytes = await image.toByteData(
      format: ui.ImageByteFormat.png,
    );

    final listBytes = Uint8List.view(pngBytes.buffer);

    File file = await writeBytes(listBytes);

    String imageUrl = await fetchResponse(file);

    setState(() {
      imageOutput = CachedNetworkImage(
        imageUrl: imageUrl,
      );

      imageBytes = pngBytes;
    });
  }

  void updatePoints(List<DrawingArea> input) {
    // since I'm mutating state but not changing it,
    // I need to create new list for StatefulWidget
    // to notice change and rebuild itself
    setState(() => points = List.of(input));
  }

  @override
  Widget build(BuildContext context) {
    return HomeFrame(
      children: [
        if (!loading) ...[
          CanvasBox(
            onPanDown: (details) {
              points.add(
                DrawingArea(
                  point: details.localPosition,
                  areaPaint: areaPaint,
                ),
              );
              updatePoints(points);
            },
            onPanUpdate: (details) {
              points.add(
                DrawingArea(
                  point: details.localPosition,
                  areaPaint: areaPaint,
                ),
              );
              updatePoints(points);
            },
            onPanEnd: (details) {
              points.add(null);
              updatePoints(points);
            },
            points: points,
          ),
          SizedBox(
            height: 10.0,
          ),
          CanvasBar(
            onSave: () {
              processSketch(points);
              setState(() => loading = true);
            },
            onClear: () {
              points.clear();
              updatePoints(points);
            },
          )
        ] else
          Result(
            imageOutput: imageOutput,
            imageBytes: imageBytes,
            onArrowBack: () {
              setState(() => loading = false);
            },
          ),
      ],
    );
  }
}
