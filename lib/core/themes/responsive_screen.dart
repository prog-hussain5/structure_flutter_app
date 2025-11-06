import 'package:flutter/widgets.dart';

/// Simple responsive builder placeholder.
class ResponsiveScreen extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveScreen({super.key, required this.mobile, this.tablet, this.desktop});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    if (w >= 1024 && desktop != null) return desktop!;
    if (w >= 600 && tablet != null) return tablet!;
    return mobile;
  }
}
