
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../core/constants/app_colors.dart';
import '../core/utils/app_loader.dart';
import '../core/utils/utils.dart';
import '../theme/app_style.dart';

/// Common App button --------- >>>

enum ButtonType { elevated, outline }

enum ImagePosition { start, end }

class AppButton extends StatefulWidget {
  final ButtonType? buttonType;
  final VoidCallback onPressed;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color? backgroundColor;
  final bool? disableButton;
  final String? title;
  final FontWeight? titleWeight;
  final Color? titleColor;
  final double? titleSize;
  final String? image;
  final double? imageSize;
  final ImagePosition? imagePosition;
  final Widget? child;
  final bool? loader;
  final EdgeInsetsGeometry? padding;

  const AppButton({
    super.key,
    this.buttonType = ButtonType.elevated,
    required this.onPressed,
    this.height,
    this.width,
    this.borderColor,
    this.backgroundColor,
    this.disableButton = false,
    this.title = "",
    this.titleColor,
    this.titleSize,
    this.image,
    this.imageSize,
    this.imagePosition = ImagePosition.start,
    this.child,
    this.loader = false,
    this.padding,
    this.titleWeight,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  RxBool buttonPress = false.obs;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        TweenAnimationBuilder(
          duration: const Duration(milliseconds: 1200),
          curve: Curves.elasticOut,
          tween: widget.loader! || buttonPress.value ? Tween(begin: 0.9, end: 0.97) : Tween(begin: 1.0, end: 1.0),
          builder: (context, value, child) {
            return Transform.scale(
              scale: value,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: widget.width ?? Get.width,
                height: widget.height ?? 44.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(defaultRadius * 3),
                  color: widget.backgroundColor ?? (widget.buttonType == ButtonType.outline ? null : Theme.of(context).colorScheme.primary.withOpacity(widget.disableButton! ? .2 : 1.0)),
                  border: widget.buttonType == ButtonType.outline ? Border.all(color: widget.borderColor ?? Theme.of(context).colorScheme.primary.withOpacity(disableOpacity)) : null,
                ),
                child: RawMaterialButton(
                  onPressed: loadingOrDisableStatus ? widget.onPressed : null,
                  splashColor: Colors.grey.withOpacity(widget.loader! ? 0 : .18),
                  highlightElevation: widget.loader! ? 0.0 : 8.0,
                  // highlightColor: Theme.of(context).colorScheme.primary.withOpacity(widget.buttonType == ButtonType.outline ? .1 : .0),
                  highlightColor: Colors.white12.withOpacity(widget.buttonType == ButtonType.outline ? .1 : .0),
                  hoverElevation: widget.loader! ? 0.0 : 4.0,
                  elevation: widget.loader! ? 0.0 : 2.0,
                  visualDensity: VisualDensity.compact,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(defaultRadius * 3)),
                  padding: widget.padding ?? EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                  onHighlightChanged: loadingOrDisableStatus
                      ? (press) {
                          setState(() {
                            buttonPress.value = press;
                          });
                        }
                      : null,
                  child: widget.loader!
                      ? CircularLoader(color: (widget.loader! && widget.buttonType == ButtonType.elevated ? AppColors.white : null))
                      : (widget.child ??
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /// Start Image widget
                              if (!Utils.isValidationEmpty(widget.image) && widget.imagePosition == ImagePosition.start) ...[
                                imageView,
                                if (widget.title!.isNotEmpty) 10.horizontalSpace,
                              ],

                              /// Title widget
                              if (!Utils.isValidationEmpty(widget.title))
                                Text(
                                  widget.title!,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                        fontSize: widget.titleSize ?? 14.sp,
                                        color: titleColor,
                                        fontWeight: widget.titleWeight ?? FontWeight.w600,
                                      ),
                                ),

                              /// End Image widget
                              if (!Utils.isValidationEmpty(widget.image) && widget.imagePosition == ImagePosition.end) ...[
                                if (widget.title!.isNotEmpty) 10.horizontalSpace,
                                imageView,
                              ],
                            ],
                          )),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget get imageView => GetUtils.isVector(widget.image!)
      ? SvgPicture.asset(
          widget.image!,
          // colorFilter: ColorFilter.mode(widget.imageColor ?? AppColors.primaryColor, BlendMode.srcIn),
          width: widget.imageSize ?? 12.h,
          height: widget.imageSize ?? 12.h,
        )
      : Image.asset(
          widget.image!,
          width: widget.imageSize ?? 12.h,
          height: widget.imageSize ?? 12.h,
        );

  Color? get titleColor {
    return widget.titleColor ?? (widget.buttonType == ButtonType.outline ? Theme.of(context).primaryColor.withOpacity(disableOpacity) : AppColors.primaryTextColor);
  }

  bool get loadingOrDisableStatus {
    return widget.disableButton! ? false : !widget.loader!;
  }

  double get disableOpacity {
    return widget.disableButton! ? .4 : 1;
  }
}
