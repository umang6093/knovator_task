import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:knovator_task/core/constants/app_assets.dart';
import 'package:knovator_task/core/constants/app_colors.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    this.alignment,
    this.height,
    this.width,
    this.iconSize,
    this.padding,
    this.decoration,
    this.icon = AppAssets.icBackArrow,
    this.onTap,
    this.borderColor,
  });

  final Alignment? alignment;

  final double? height;

  final double? width;
  final Color? borderColor;

  final double? iconSize;

  final EdgeInsetsGeometry? padding;

  final ButtonStyle? decoration;

  final dynamic icon;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: iconButtonWidget,
          )
        : iconButtonWidget;
  }

  Widget get iconButtonWidget => SizedBox(
        height: height ?? 0,
        width: width ?? 0,
        child: IconButton(
          onPressed: onTap,
          padding: EdgeInsets.zero,
          style: decoration,
          icon: icon is IconData
              ? Icon(icon, size: iconSize)
              : SvgPicture.asset(
                  icon,
                  height: iconSize,
                  width: iconSize,
                  colorFilter: const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                ),
        ),
      );
}

/// Extension on [AppIconButton] to facilitate inclusion of all types of border style etc
extension IconButtonStyle on AppIconButton {
  static ButtonStyle get outlineBorder => IconButton.styleFrom(
        alignment: Alignment.center,
        side: const BorderSide(color: AppColors.white, width: 1.4),
      );

  static ButtonStyle get outlineBorderWithFillPrimary => IconButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: AppColors.primaryColor,
        side: const BorderSide(color: AppColors.white, width: 1.4),
      );
  // static BoxDecoration get fillPrimary => BoxDecoration(
  //       color: Theme.of(Get.context!).colorScheme.primary.withOpacity(1),
  //       borderRadius: BorderRadius.circular(16.h),
  //     );
}
