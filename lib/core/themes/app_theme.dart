import 'package:flutter/material.dart';
import 'app_color.dart';

/// App theme placeholder.
class AppTheme {
  static ThemeData get light => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: true,
      );
}
