import 'package:flutter/material.dart';

class TipSlider extends StatelessWidget {
  const TipSlider({
    super.key,
    required this.tipPercentage,
    required this.onChanged,
  });

  final double tipPercentage;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: tipPercentage,
      onChanged: onChanged,
      min: 0.0,
      max: 0.5,
      label: '${(tipPercentage * 100).round()}%',
      divisions: 5,
    );
  }
}
