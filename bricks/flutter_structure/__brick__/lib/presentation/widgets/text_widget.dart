import 'package:flutter/material.dart';
import 'package:rifqa_app/core/themes/app_color.dart';
import 'package:rifqa_app/core/themes/responsive_screen.dart';
import 'package:rifqa_app/core/utils/app_constants.dart';


class TextWidget extends StatelessWidget {
  final String title;
  final double? fontSize;
  final double? height;
   final double? letterSpacing;
  final TextAlign alignment;
  final FontWeight? fontWeight;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final String? fontFamily;
  final TextTheme? textStyle;
  final TextDirection? textDirection;
  final bool underline;

  const TextWidget({
    super.key,
    required this.title,
    this.fontSize,
    this.fontWeight,
    this.color = AppColors.primary,
    this.alignment = TextAlign.right,
    this.maxLines,
    this.overflow,
    this.height,
    this.fontFamily = AppConstants.notoSansFont,
    this.textStyle,
    this.textDirection,
    this.underline = false,
     this.letterSpacing = 0.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alignment,
      overflow: overflow,
      textScaleFactor: AppDimensions.textScaleFactor(context),
      textDirection: textDirection,
      maxLines: maxLines,
      style: TextStyle(
        letterSpacing: letterSpacing,
        height: height,
        fontWeight: fontWeight,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
        decorationColor: color,
        decorationThickness: underline ? 2 : null,
        fontFamily: fontFamily,
        color: color,
        fontSize: fontSize,
        overflow: overflow,
      ),
    );
  }
}