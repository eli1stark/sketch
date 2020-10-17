import 'dart:typed_data';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key key,
    @required this.onArrowBack,
    @required this.imageOutput,
    @required this.imageBytes,
  }) : super(key: key);

  final Function onArrowBack;
  final Widget imageOutput;
  final ByteData imageBytes;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 40.0,
          ),
          onPressed: onArrowBack,
        ),
        SizedBox(
          height: 30.0,
        ),
        Center(
          child: Container(
            height: 256,
            width: 256,
            child: imageOutput,
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Center(
          child: Image.memory(
            Uint8List.view(
              imageBytes.buffer,
            ),
            width: 256.0,
            height: 256.0,
          ),
        )
      ],
    );
  }
}
