
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:knovator_task/widgets/app_icon_button.dart';

import '../core/constants/app_colors.dart';
import '../theme/app_style.dart';
import '../theme/app_text.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool? showLeading;
  final String? leadingImage;
  final void Function()? leadingOnPress;
  final List<Widget>? actionWidget;

  const AppAppBar({
    super.key,
    this.title,
    this.actionWidget,
    this.leadingOnPress,
    this.leadingImage,
    this.showLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backgroundColor,
      surfaceTintColor: AppColors.backgroundColor,
      centerTitle: true,
      leading: (showLeading!)
          ? Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              children: [
                SizedBox(width: defaultPadding),
                AppIconButton(
                  height: 34.h,
                  width: 34.h,
                  iconSize: 12.h,
                  decoration: IconButtonStyle.outlineBorder,
                  onTap: leadingOnPress ?? () => Get.back(),
                ),
              ],
            )
          : const SizedBox.shrink(),
      title: AppText(
        title ?? "",
        textSize: TextSize.headline_24,
        textWight: TextWight.w500,
        textColor: Colors.blueAccent,
      ),
      actions: actionWidget ?? [],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
