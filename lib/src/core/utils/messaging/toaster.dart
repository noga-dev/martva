import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

class Toaster {
  static void info(String message) {
    BotToast.showText(
      text: message,
      backgroundColor: Colors.blue,
      duration: const Duration(seconds: 2),
    );
  }

  static void success(String message) {
    BotToast.showText(
      text: message,
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 2),
    );
  }

  static void warn(String message) {
    BotToast.showText(
      text: message,
      backgroundColor: Colors.orange,
      duration: const Duration(seconds: 2),
    );
  }

  static void error(String message) {
    BotToast.showText(
      text: message,
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 2),
    );
  }
}
