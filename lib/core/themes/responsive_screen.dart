import 'dart:math';
import 'package:flutter/material.dart';

// this class for get height and width
class AppDimensions {
  // size App Bar Height
  static double appBarHeight() => AppBar().preferredSize.height;

  // size Status Bar Height
  static double statusBarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  // size Screen Height
  static double screenHeight(BuildContext context) =>
      MediaQuery.sizeOf(context).height;

  // size Screen Width
  static double screenWidth(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

  // size text
  static double? textScaleFactor(BuildContext context,
      {double maxTextScaleFactor = 2}) {
    final width = screenWidth(context);
    double val = (width / 1400) * maxTextScaleFactor;
    return max(1, min(val, maxTextScaleFactor));
  }

  // todo  responsive size ipad and phone

  // Check if device is tablet
  static bool isTablet(BuildContext context) {
    final width = screenWidth(context);
    final height = screenHeight(context);
    final diagonal = sqrt(pow(width, 2) + pow(height, 2));
    return diagonal > 1100; // Tablet threshold
  }

  // Check if device is phone
  static bool isPhone(BuildContext context) => !isTablet(context);

  // Responsive font size
  static double responsiveFontSize(BuildContext context, double baseFontSize) {
    final width = screenWidth(context);
    if (width > 1200) {
      // Very large tablets/desktop
      return baseFontSize * 2.0;
    } else if (width > 800) {
      // Regular tablets
      return baseFontSize * 1.6;
    } else if (width > 600) {
      // Small tablets
      return baseFontSize * 1.3;
    }
    // Phones
    return baseFontSize;
  }

  // Responsive spacing
  static double responsiveSpacing(BuildContext context, double baseSpacing) {
    final width = screenWidth(context);
    if (width > 1200) {
      // Very large tablets/desktop
      return baseSpacing * 2.2;
    } else if (width > 800) {
      // Regular tablets
      return baseSpacing * 1.8;
    } else if (width > 600) {
      // Small tablets
      return baseSpacing * 1.4;
    }
    // Phones
    return baseSpacing;
  }

  // Responsive icon or image size
  static double responsiveIconOrImageSize(BuildContext context, double baseIconSize) {
    final width = screenWidth(context);
    if (width > 1200) {
      // Very large tablets/desktop
      return baseIconSize * 2.0;
    } else if (width > 800) {
      // Regular tablets
      return baseIconSize * 1.7;
    } else if (width > 600) {
      // Small tablets
      return baseIconSize * 1.4;
    }
    // Phones
    return baseIconSize;
  }
   
}