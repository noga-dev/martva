import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:martva/src/core/design_system/presentation/tokens/ds_duration_tokens.dart';

class Toaster {
  static void _toast(
    String message, {
    Alignment align = const Alignment(0, -0.86),
    Color color = Colors.grey,
    Duration duration = DurationTokens.longest,
  }) {
    BotToast.showText(
      text: message,
      align: align,
      contentColor: color,
      duration: duration,
    );
  }

  static void info(
    String message, {
    Alignment align = const Alignment(0, -0.88),
  }) {
    _toast(
      message,
      align: align,
      color: Colors.blue,
    );
  }

  static void success(String message) {
    _toast(
      message,
      align: const Alignment(0, -0.86),
      color: Colors.green,
    );
  }

  static void warn(String message) {
    _toast(
      message,
      align: const Alignment(0, -0.86),
      color: Colors.orange,
    );
  }

  static void error(String message) {
    _toast(
      message,
      align: const Alignment(0, -0.86),
      color: Colors.red,
    );
  }
}
