import 'dart:io';

import 'package:flutter/material.dart';

/// Prints text in red color.
void printRed(dynamic text) => _printColoredMessage(text, '\x1B[91m');

/// Prints text in green color.
void printGreen(dynamic text) => _printColoredMessage(text, '\x1B[92m');

/// Prints text in yellow color.
void printYellow(dynamic text) => _printColoredMessage(text, '\x1B[93m');

/// Prints text in blue color.
void printBlue(dynamic text) => _printColoredMessage(text, '\x1B[94m');

/// Prints text in purple color.
void printPurple(dynamic text) => _printColoredMessage(text, '\x1B[95m');

/// Prints text in white color.
void printWhite(dynamic text) => _printColoredMessage(text, '\x1B[97m');

/// Prints an error message with specified type.
void printError({required dynamic type, required dynamic text}) => _printColoredMessage('$type: $text', '\x1B[51m\x1B[91m');

/// Prints a general message with specified type.
void printMessage({required dynamic type, required dynamic text}) => _printColoredMessage('$type: $text', '\x1B[51m\x1B[96m');

/// Prints data with specified type.
void printData({required dynamic type, required dynamic text}) => _printColoredMessage('$type:\n$text', '\x1B[7m');

/// Internal function to print colored messages based on platform.
void _printColoredMessage(dynamic text, String colorCode) {
  if (Platform.isAndroid) {
    debugPrint('$colorCode$text\x1B[0m', wrapWidth: 99999);
  } else {
    debugPrint(text.toString(), wrapWidth: 99999);
  }
}
