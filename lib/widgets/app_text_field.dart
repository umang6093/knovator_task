import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../core/constants/app_colors.dart';
import '../theme/app_style.dart';
import '../theme/app_text.dart';

/// Common App TextField --------- >>>
class AppTextField extends StatelessWidget {
  /// Text filed Controller
  final TextEditingController? controller;

  /// Title Text
  final String? titleText;
  final String? imageText;
  final Color? imageColor;

  /// Text
  final TextStyle? style;
  final double? textSize;
  final TextCapitalization? textCapitalization;

  /// Hint Text
  final String? hintText;
  final Color? hintTextColor;
  final TextStyle? hintStyle;

  /// Text Input Handel
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final bool? obscureText;

  /// Activity
  final VoidCallback? onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;

  /// Validation
  final FormFieldValidator<String>? validate;

  /// Text Filed Box
  final bool? autofocus;
  final bool? enabled;
  final bool? readOnly;

  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;

  /// Icons
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixImage;
  final String? suffixImage;
  final Color? suffixImageColor;
  final BoxConstraints? prefixIconConstraints;
  final BoxConstraints? suffixIconConstraints;
  final VoidCallback? prefixOnTap;
  final VoidCallback? suffixOnTap;

  /// Border
  final Color? borderColor;
  final BorderRadius? borderRadius;

  final String? errorText;

  const AppTextField({
    super.key,
    this.controller,
    this.titleText,
    this.style,
    this.textSize,
    this.textCapitalization = TextCapitalization.none,
    this.hintText,
    this.hintStyle,
    this.textInputAction = TextInputAction.next,
    this.inputFormatters,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.obscureText,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.validate,
    this.autofocus,
    this.enabled = true,
    this.readOnly = false,
    this.fillColor,
    this.contentPadding,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixImage = "",
    this.suffixImage = "",
    this.prefixOnTap,
    this.suffixOnTap,
    this.borderColor,
    this.imageText,
    this.imageColor,
    this.hintTextColor,
    this.suffixImageColor,
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.borderRadius,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    if (titleText != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (titleText != null) filedTitle(),
          myTextFormField(context),
        ],
      );
    } else {
      return myTextFormField(context);
    }
  }

  Padding filedTitle() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText(
            titleText!,
            textSize: TextSize.small_12,
            textWight: TextWight.w500,
          ),
          AppText(
            imageText ?? "",
            textSize: TextSize.small_12,
            textWight: TextWight.w500,
            textColor: imageColor ?? AppColors.secondaryTextColor,
          ),
        ],
      ),
    );
  }

  Widget myTextFormField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: TextFormField(
        /// Text field controller
        controller: controller,

        /// Text
        style: style ??
            Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: textSize ?? 14,
                  color: AppColors.secondaryTextColor,
                  fontWeight: FontWeight.w500,
                ),
        textCapitalization: textCapitalization!,
        textAlignVertical: TextAlignVertical.center,

        /// Text Filed Box
        enabled: enabled,
        readOnly: readOnly!,
        autofocus: autofocus ?? false,
        cursorColor: AppColors.primaryColor,
        cursorRadius: const Radius.circular(6),

        /// Text Input Handel
        textInputAction: textInputAction,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        maxLines: maxLines,
        minLines: minLines,
        maxLength: maxLength != 0 ? maxLength : null,

        /// Validation
        validator: validate,

        /// Activity
        onTap: onTap,
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText ?? false,

        decoration: InputDecoration(
          /// Box Color
          filled: true,
          fillColor: fillColor ?? (enabled! ? Colors.transparent : Theme.of(context).disabledColor.withOpacity(0.1)),
          errorText: errorText,
          errorMaxLines: 3,
          errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 14,
                color: AppColors.secondaryTextColor,
                fontWeight: FontWeight.w400,
              ),

          /// Hint Text
          hintText: hintText,
          hintStyle: hintStyle ??
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: textSize ?? 14,
                    color: hintTextColor ?? AppColors.secondaryTextColor,
                    fontWeight: FontWeight.w400,
                  ),

          /// Counter widget
          counter: const SizedBox(),

          /// Remove Extra Size from text filed
          isCollapsed: true,
          isDense: true,

          /// Remove Extra Size from text filed
          contentPadding: contentPadding ?? const EdgeInsets.all(14).copyWith(bottom: 16),

          /// Prefix & suffix Icon and image with buttons
          prefixIcon: prefixOnTap != null
              ? InkWell(
                  borderRadius: BorderRadius.circular(defaultRadius * 3),
                  hoverColor: Colors.transparent,
                  onTap: prefixOnTap,
                  child: getPrefixIcon,
                )
              : getPrefixIcon,
          prefixIconConstraints: prefixIconConstraints ?? BoxConstraints.tight(const Size(48, 48)),
          suffixIcon: suffixOnTap != null
              ? InkWell(
                  borderRadius: BorderRadius.circular(defaultRadius * 3),
                  hoverColor: Colors.transparent,
                  onTap: suffixOnTap,
                  child: getSuffixIcon,
                )
              : getSuffixIcon,
          suffixIconConstraints: suffixIconConstraints ?? BoxConstraints.tight(const Size(48, 48)),

          /// All type of border management
          border: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(defaultRadius * 3)),
            borderSide: BorderSide(color: borderColor ?? Theme.of(context).primaryColor, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(defaultRadius * 3)),
            borderSide: BorderSide(color: borderColor ?? AppColors.borderColor, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(defaultRadius * 3)),
            borderSide: BorderSide(color: borderColor ?? Theme.of(context).primaryColor, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(defaultRadius * 3)),
            borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.error, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(defaultRadius * 3)),
            borderSide: BorderSide(color: borderColor ?? AppColors.disableColor, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(defaultRadius * 3)),
            borderSide: BorderSide(color: borderColor ?? Theme.of(context).colorScheme.error, width: 1),
          ),
        ),
      ),
    );
  }

  Widget? get getPrefixIcon {
    return (prefixImage!.isEmpty)
        ? prefixIcon
        : Padding(
            padding: const EdgeInsets.only(right: 10, left: 18),
            child: GetUtils.isVector(prefixImage!) ? SvgPicture.asset(prefixImage!) : Image.asset(prefixImage!),
          );
  }

  Widget? get getSuffixIcon {
    return suffixImage!.isEmpty
        ? suffixIcon
        : Padding(
            padding: const EdgeInsets.only(right: 14, left: 14),
            child: GetUtils.isVector(suffixImage!) ? SvgPicture.asset(suffixImage!) : Image.asset(suffixImage!),
          );
  }
}
