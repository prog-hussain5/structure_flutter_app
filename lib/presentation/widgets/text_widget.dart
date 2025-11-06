import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  const TextWidget(this.text, {super.key, this.style});

  @override
  Widget build(BuildContext context) => Text(text, style: style);
}
