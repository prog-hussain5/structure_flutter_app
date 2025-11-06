import 'package:flutter/material.dart';
import 'package:rifqa_app/core/themes/app_color.dart';

class CircularProgressWidget extends StatelessWidget {
  final Color color;
  final Animation<Color?>? valueColor;
  const CircularProgressWidget({
    super.key,
    this.color = AppColors.primaryDark,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: color,
        valueColor: valueColor,
      ),
    );
  }
}