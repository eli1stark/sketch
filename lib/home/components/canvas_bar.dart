import 'package:flutter/material.dart';
import 'constants.dart';

class CanvasBar extends StatelessWidget {
  const CanvasBar({
    Key key,
    @required this.onSave,
    @required this.onClear,
  }) : super(key: key);

  final Function onSave;
  final Function onClear;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: borderRadiusCircular20,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
            icon: Icons.save,
            onPressed: onSave,
          ),
          CustomIconButton(
            icon: Icons.layers_clear,
            onPressed: onClear,
          ),
        ],
      ),
    );
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key key,
    @required this.icon,
    @required this.onPressed,
  }) : super(key: key);

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      onPressed: onPressed,
    );
  }
}
