import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:knovator_task/theme/app_style.dart';
import 'package:knovator_task/theme/app_text.dart';

import '../constants/app_colors.dart';

class AppLoader extends StatelessWidget {
  const AppLoader({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height,
      width: Get.width,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              borderRadius: BorderRadius.circular(defaultPadding),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularLoader(color: Theme.of(context).primaryColor),
                const SizedBox(width: 14),
                const AppText(
                  "Loading...",
                  textSize: TextSize.medium_14,
                  textColor: AppColors.primaryTextColor,
                  textWight: TextWight.w500,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularLoader extends StatelessWidget {
  final Color? color;
  final double? loaderSize;

  const CircularLoader({super.key, this.color, this.loaderSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (loaderSize ?? 20.h),
      height: (loaderSize ?? 20.h),
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(color ?? AppColors.primaryTextColor),
        strokeCap: StrokeCap.round,
        strokeWidth: 2,
      ),
    );
  }
}
