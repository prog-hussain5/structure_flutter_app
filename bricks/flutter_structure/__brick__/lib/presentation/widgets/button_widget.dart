import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rifqa_app/core/themes/app_color.dart';
import 'package:rifqa_app/core/themes/responsive_screen.dart';
import 'package:rifqa_app/core/utils/app_constants.dart';
import 'package:rifqa_app/core/utils/utils.dart';
import 'package:rifqa_app/presentation/widgets/circular_progress_widget.dart';
import 'package:rifqa_app/presentation/widgets/text_widget.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallBack? onPressed;
  final String title;
  final Color backgroundColor;
  final double? width;
  final IconData? icon;
  final String? iconAsset;
  final Color? textColor;
  final Color? iconColor;
  final Color circularColor;
  final ImageType imageType;
  final double fontSize;
  final double height;
  final OutlinedBorder? shape;
  final double? elevation;
  final bool isLoading;
  final bool isSuccess; 

  const ButtonWidget({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor = AppColors.primary,
    this.width,
    this.icon,
    this.iconAsset,
    this.textColor = AppColors.whiteColor,
    this.imageType = ImageType.icon,
    this.iconColor,
    this.circularColor = AppColors.whiteColor,
    this.fontSize = 16,
    this.shape,
    this.height = 60,
    this.elevation,
    this.isLoading = false,
    this.isSuccess = false,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? AppDimensions.screenWidth(context),
      height: height,
      child: GestureDetector(
        onTap: onPressed == null
            ? null
            : (!isLoading && !isSuccess)
                ? onPressed
                : () {},
        child: Material(
          color: backgroundColor,
          shape: shape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          elevation: elevation ?? 2.0,
          child: Container(
            width: width ?? AppDimensions.screenWidth(context),
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: shape is RoundedRectangleBorder 
                  ? (shape as RoundedRectangleBorder).borderRadius as BorderRadius?
                  : BorderRadius.circular(30.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildLeadingIcon(),
                if (_shouldShowIconSpacing()) const SizedBox(width: 8),
                _buildButtonContent(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeadingIcon() {
    // Success state takes precedence
    if (isSuccess) {
      return Icon(
        Icons.check_circle_outline,
        color: iconColor ?? Colors.green,
        size: 25,
      );
    }

    // Show image/icon only if it should be visible and not loading
    if (_shouldShowImage() && !isLoading) {
      return _buildImage();
    }

    // Return empty SizedBox if no icon should be shown
    return const SizedBox.shrink();
  }

  Widget _buildImage() {
    switch (imageType) {
      case ImageType.svg:
        return SvgPicture.asset(
          iconAsset!,
          color: iconColor,
          width: 20,
          height: 20,
        );
      case ImageType.png:
        return Image.asset(
          iconAsset!,
        );
      case ImageType.icon:
        return Icon(
          icon,
          color: iconColor,
          size: 25,
        );
    }
  }

  bool _shouldShowImage() {
    switch (imageType) {
      case ImageType.svg:
      case ImageType.png:
        return iconAsset != null;
      case ImageType.icon:
        return icon != null;
    }
  }

  bool _shouldShowIconSpacing() {
    return isSuccess || (_shouldShowImage() && !isLoading);
  }

  Widget _buildButtonContent() {
    if (isLoading) {
      return CircularProgressWidget(color: circularColor);
    } else if (isSuccess) {
      return TextWidget(
        title: "تم", 
        color: textColor,
        fontFamily: AppConstants.notoSansFont,
        fontSize: fontSize,
      );
    } else {
      return TextWidget(
        title: title,
        color: textColor,
        fontFamily: AppConstants.notoSansFont,
        fontSize: fontSize,
        fontWeight : FontWeight.bold,
      );
    }
  }
}