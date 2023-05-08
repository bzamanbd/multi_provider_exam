import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  final double val;
  final void Function(double) onChanged;
  const SliderWidget({
    Key? key,
    required this.val,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slider(
        min: 0,
        max: 1,
        value: val,
        onChanged: onChanged,
      );
}
