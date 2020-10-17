import 'package:flutter/material.dart';
import 'package:sketch/models/drawing_area.dart';
import 'package:sketch/models/painter_box.dart';
import 'constants.dart';

class CanvasBox extends StatelessWidget {
  const CanvasBox({
    Key key,
    @required this.onPanDown,
    @required this.onPanUpdate,
    @required this.onPanEnd,
    @required this.points,
  }) : super(key: key);

  final Function onPanDown;
  final Function onPanUpdate;
  final Function onPanEnd;
  final List<DrawingArea> points;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 256.0,
      height: 256.0,
      decoration: BoxDecoration(
        borderRadius: borderRadiusCircular20,
        boxShadow: [canvasBoxShadow],
      ),
      child: GestureDetector(
        onPanDown: onPanDown,
        onPanUpdate: onPanUpdate,
        onPanEnd: onPanEnd,
        child: SizedBox.expand(
          child: ClipRRect(
            borderRadius: borderRadiusCircular20,
            child: CustomPaint(
              painter: PainterBox(
                points: points,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
