import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rifqa_app/core/themes/app_color.dart';
import 'package:rifqa_app/core/utils/utils.dart';
import 'package:rifqa_app/presentation/widgets/text_form_field_widget.dart';
import 'package:rifqa_app/presentation/widgets/text_widget.dart';

class AppBarWidget {
  static AppBar appBarWidget({
    required BuildContext context,
    required String title,
    String? subTitle,
    String? hintText,
    Color backgroundColor = AppColors.whiteColor,
    Color titleColor = AppColors.black,
    Color iconColor = AppColors.black,
    bool isSearching = false,
    bool leadingAvailable = true,
    TextEditingController? searchController,
    VoidCallback? onPressedBack,
    VoidCallback? onSearchSubmitted,
    VoidCallback? onSearchToggled,
    ValidCallBack? onChanged,
    Widget? action,
    bool bottom = true,
    bool centerTitle = true,
  }) {
    hintText = hintText;
    return AppBar(
      leading: leadingAvailable
          ? IconButton(
              onPressed: onPressedBack ?? () => GoRouter.of(context).pop(),
              icon: Icon(Icons.arrow_back_ios_new, color: iconColor),
            )
          : null,
      backgroundColor: backgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
      title: isSearching
          ? InputFieldWidget(
              controller: searchController!,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              hintText: hintText!,
              bottomPadding: 0,
              filled: false,
              onFieldSubmitted: onSearchSubmitted,
              onChanged: onChanged,
            )
          : Column(
              children: [
                TextWidget(title: title, color: titleColor, fontSize: 18),
                SizedBox(height: 3),
                Visibility(
                  visible: subTitle != null,
                  child: TextWidget(
                    title: subTitle ?? "",
                    color: AppColors.whiteColor,
                    fontSize: 16,
                    alignment: TextAlign.center,
                  ),
                ),
              ],
            ),
      centerTitle: centerTitle,
      actions: [
        searchController != null
            ? IconButton(
                onPressed: onSearchToggled,
                icon: Icon(
                  isSearching ? Icons.cancel : Icons.search_outlined,
                  size: 30,
                  color: iconColor,
                ),
              )
            : SizedBox.shrink(),
        action ?? SizedBox.shrink(),
      ],
    );
  }
}
