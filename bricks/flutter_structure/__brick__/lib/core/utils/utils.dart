import 'package:flutter/material.dart';
class Utils {
}


 // this file for enums and typedefs
enum ImageType { svg, png, icon }


// typedef VoidValidCallBack = void Function(String)?;
typedef VoidCallBack = void Function();
typedef VoidValidCallBackInt = void Function(int)?;
typedef ValidCallbackBoolean = void Function(bool)?;
typedef ValidCallBack = String? Function(String?);
typedef ItemBuilderCallBack = Widget? Function(BuildContext, int);
typedef DynamicCallBack = Function(dynamic)?;



  String? validatePassword({
    required String? value,
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return 'لايمكن ترك الحقل فارغا';
    }
    if (value.length < 6) {
      return "كلمة المرور يجب ان تكون اكثر من 6 احرف";
    }
    return null;
  }

   String? validate({
    required String? value,
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return 'لايمكن ترك الحقل فارغا';
    }
    return null;
  }


  String? validateNameLength({
    required String? value,
    required BuildContext context,
  }) {
    if (value == null || value.isEmpty) {
      return 'لايمكن ترك الحقل فارغا';
    }

    final words = value.trim().split(RegExp(r'\s+'));

    if (words.length < 3) {
      return "يجب أن يحتوي الاسم على 3 أسماء على الأقل";
    }

    for (var word in words) {
      if (word.length < 2) {
        return "كل كلمة يجب أن تحتوي على حرفين على الأقل";
      }
    }

    return null;
  }

