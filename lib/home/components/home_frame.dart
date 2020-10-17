import 'package:flutter/material.dart';

class HomeFrame extends StatelessWidget {
  HomeFrame({
    @required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromRGBO(138, 35, 135, 1.0),
                Color.fromRGBO(233, 64, 87, 1.0),
                Color.fromRGBO(242, 113, 33, 1.0),
              ],
            ),
          ),
          child: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
