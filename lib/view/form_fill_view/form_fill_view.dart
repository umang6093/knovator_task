import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:knovator_task/theme/app_style.dart';
import 'package:knovator_task/theme/app_text.dart';
import 'package:knovator_task/view/form_fill_view/form_fill_controller.dart';
import 'package:knovator_task/widgets/app_app_bar.dart';
import 'package:knovator_task/widgets/app_button.dart';
import 'package:knovator_task/widgets/app_text_field.dart';

class FormFillView extends GetView<FormFillController> {
  const FormFillView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        title: "Form Fill For Resume",
        showLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(defaultPadding),
        children: [
          const AppText(
            "Personal Details",
            textSize: TextSize.title_18,
            textWight: TextWight.w600,
          ),
          16.verticalSpace,
          AppTextField(
            hintText: "Enter your email",
            titleText: "Email Address",
            controller: controller.email,
          ),
          8.verticalSpace,
          AppTextField(
            hintText: "Enter your first name",
            titleText: "First Name",
            controller: controller.firstName,
          ),
          8.verticalSpace,
          AppTextField(
            hintText: "Enter your last name",
            titleText: "Last Name",
            controller: controller.lastName,
          ),
          8.verticalSpace,
          AppTextField(
            hintText: "Enter your job role",
            titleText: "Job Role",
            controller: controller.jobRole,
          ),
          8.verticalSpace,
          AppTextField(
            hintText: "Enter your phone number",
            titleText: "Phone Number",
            controller: controller.phoneNumber,
          ),
          16.verticalSpace,
          const AppText(
            "Profile",
            textSize: TextSize.title_18,
            textWight: TextWight.w600,
          ),
          16.verticalSpace,
          AppTextField(
            hintText: "Enter your text here",
            titleText: "Summary",
            controller: controller.profileSummary,
            borderRadius: BorderRadius.circular(defaultRadius),
            minLines: 5,
            maxLines: 7,
          ),
          8.verticalSpace,
          AppTextField(
            hintText: "Enter your linkdin URL",
            titleText: "Linkdin",
            controller: controller.linkdinURL,
          ),
          12.verticalSpace,
          AppButton(
            onPressed: () {},
            title: "Continue",
          ),
        ],
      ),
    );
  }
}
