import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';


class InputFieldWidget extends StatelessWidget {
  final String hintText;
  final String? iconImage;
  final String? suffixIconImage; 
  final IconData? icon;
  final IconData? suffixIcon;
  final int maxLines;
  final double bottomPadding;
  final double heightVertical;
  final ValidCallBack? valid;
  final ValidCallBack? onChanged;
  final TextInputType textInputType;
  final VoidCallBack? onTap;
  final double? width;
  final bool readOnly;
  final bool obscureText;
  final FocusNode? focusNode;
  final bool filled;
  final VoidCallback? onFieldSubmitted;
  final VoidCallback? onPressedSuffix;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final Color fillColor;
  final TextAlign? textAlign;
  final Color hintTextColor;
  final Color? textColorInputField;
  final Color? borderColor;
  final int? maxLength;
  final double? borderRadius;
  final List<TextInputFormatter>? inputFormatters;

  const InputFieldWidget({
    super.key,
    required this.hintText,
    this.iconImage,
    this.suffixIconImage,
    this.icon,
    this.suffixIcon,
    this.maxLines = 1,
    this.bottomPadding = 10,
    this.heightVertical = 25,
    this.valid,
    this.onChanged,
    required this.textInputType,
    required this.controller,
    this.width,
    this.focusNode,
    this.filled = true,
    this.onTap,
    this.readOnly = false,
    this.onFieldSubmitted,
    this.onPressedSuffix,
    this.obscureText = false,
    this.textInputAction,
    this.fillColor = AppColors.whiteColor,
    this.textAlign,
    this.hintTextColor = AppColors.grey400,
    this.textColorInputField = AppColors.black,
    this.borderColor = Colors.transparent,
    this.maxLength,
    this.borderRadius = 20,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    double sizeWidth = AppDimensions.screenWidth(context);
    return Container(
      padding: EdgeInsets.only(bottom: bottomPadding),
      width: width ?? sizeWidth,
      // height: 59,
      child: TextFormField(
        maxLength: maxLength,
        onTap: onTap,
        textInputAction: textInputAction,
        onFieldSubmitted: (_) => onFieldSubmitted?.call(),
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText,
        readOnly: readOnly,
        validator: valid,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        keyboardType: textInputType,
        inputFormatters: inputFormatters,
        maxLines: maxLines,
        textAlign: textAlign ?? TextAlign.start,
        style: TextStyle(
          color: textColorInputField,
          fontSize: 14,
          fontFamily: AppConstants.notoSansFont,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide(
              color: borderColor!,
              width: 1.5,
            ),
          ),
          hintText: hintText,
          // prefix: Icon(Icons.check),
          suffixIcon: (suffixIcon != null || suffixIconImage != null)
              ? (suffixIconImage != null
                  ? IconButton(
                      onPressed: onPressedSuffix,
                      icon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          suffixIconImage!,
                          width: 22,
                          height: 22,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : IconButton(
                      icon: Icon(
                        suffixIcon,
                        color: hintTextColor, 
                        size: 25,
                      ),
                      onPressed: onPressedSuffix,
                    ))
              : null,
          hintStyle: TextStyle(
            color: hintTextColor,
            fontFamily: AppConstants.notoSansFont,
          ),
          errorStyle: TextStyle(
            fontFamily: AppConstants.notoSansFont,
            fontSize: 12,
          ),
          // focusedBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(20),
          //   borderSide: BorderSide(
          //     color: AppColors.cream,
          //     width: 1.0,
          //   ),
          // ),
          prefixIcon: Padding(
            padding: EdgeInsets.all(10.0),
            child: iconImage != null
                ? SvgPicture.asset(
                    iconImage!,
                    width: 24,
                    height: 24,
                  )
                : icon != null
                    ? Icon(
                        icon,
                        color: hintTextColor,
                        size: 25,
                      )
                    : SizedBox.shrink(),
          ),
          filled: filled,
          fillColor: fillColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius!),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: heightVertical,
            horizontal: 10,
          ),
        ),
      ),
    );
  }
}
