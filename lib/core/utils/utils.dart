import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

/// Utility class for common functions used in Flutter development
class Utils {
  static final ImagePicker _picker = ImagePicker();

  /// Set the status bar style to dark
  static void darkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  /// Set the status bar style to light
  static void lightStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  /// Set the preferred screen orientation to portrait
  static void screenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// Hides the keyboard
  static closeKeyboard() {
    return SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  /// Get the type of the device (Android or iOS)
  static String getDeviceType() {
    return Platform.isAndroid ? 'Android' : 'iOS';
  }

  /// Show a toast message
  static void showToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      textColor: Colors.black,
      backgroundColor: Colors.white,
    );
  }

  /// Show a snack bar
  static void showSnackBar({
    String title = "",
    required String message,
  }) {
    Get.snackbar(
      title,
      message,
      borderRadius: 10,
      snackPosition: SnackPosition.BOTTOM,
      colorText: Colors.white,
      backgroundColor: Colors.redAccent,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14)
          .copyWith(top: 8),
      margin: const EdgeInsets.only(bottom: 20),
      titleText: title.isEmpty ? const SizedBox.shrink() : null,
    );
  }

  /// Validate email format
  static bool emailValidator(String email) {
    RegExp regExp = RegExp(
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return regExp.hasMatch(email);
  }

  /// Validate phone number format
  static bool phoneValidator(String contact) {
    RegExp regExp = RegExp(r'^[+]*[(]?[0-9]{1,4}[)]?[-\s./0-9]*$');
    return regExp.hasMatch(contact);
  }

  /// Validate password format
  static bool passwordValidator(String contact) {
    RegExp regExp =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$0&*~]).{8,}$');
    return regExp.hasMatch(contact);
  }

  /// Check if a value is empty or null
  static bool isValidationEmpty(dynamic value) {
    String val = value.toString();
    return (val.isEmpty || val == "null" || val == "" || val == "NULL");
  }

  /// Hide the keyboard
  static void hideKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// Launches a URL
  static void launchURL(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  /// Convert duration to minutes
  static String convertDurationToMinutes(String text) {
    String data = '00:00:30';
    List<String> splitData = data.toString().split(':');
    int result = (int.parse(splitData[0].toString()) * 60) +
        int.parse(splitData[1].toString());
    int duration = result;
    if (splitData[2].toString() != '0') {
      duration = result + 1;
    }
    return "$duration Min";
  }

  static Future<File?> pickImage(ImageSource source) async {
    try {
      XFile? xFile = await _picker.pickImage(source: source);
      if (xFile != null) {
        return File(xFile.path);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  static Future<List<String>> pickMultipleImage() async {
    try {
      List<XFile> xFile = await _picker.pickMultiImage();
      if (xFile.isNotEmpty) {
        List<String> images = xFile.map((e) {
          String base64String = base64Encode(File(e.path).readAsBytesSync());
          return 'data:image/png;base64,$base64String';
        }).toList();
        return images;
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}
