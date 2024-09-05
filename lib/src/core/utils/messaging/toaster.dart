import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:martva/src/core/theme/view/tokens/ds_duration_tokens.dart';

class Toaster {
  static void _toast(
    String message, {
    Alignment align = const Alignment(0, -0.86),
    Color color = Colors.grey,
    Duration? duration,
  }) {
    BotToast.showText(
      text: message,
      align: align,
      contentColor: color,
      duration: duration ?? DSDurationTokens.xxxl.duration,
    );
  }

  static void info(
    String message, {
    Alignment align = const Alignment(0, -0.75),
    Duration? duration,
  }) {
    _toast(
      message,
      align: align,
      color: Colors.blue,
      duration: duration ?? DSDurationTokens.xxl.duration,
    );
  }

  static void success(
    String message, {
    Alignment align = const Alignment(0, -0.86),
    Duration? duration,
  }) {
    _toast(
      message,
      align: const Alignment(0, -0.86),
      color: Colors.green,
      duration: duration ?? DSDurationTokens.m.duration,
    );
  }

  static void warn(
    String message, {
    Alignment align = const Alignment(0, -0.86),
    Duration? duration,
  }) {
    _toast(
      message,
      align: const Alignment(0, -0.86),
      color: Colors.orange,
      duration: duration ?? DSDurationTokens.xl.duration,
    );
  }

  static void error(
    String message, {
    Alignment align = const Alignment(0, -0.86),
    Duration? duration,
  }) {
    _toast(
      message,
      align: const Alignment(0, -0.86),
      color: Colors.red,
      duration: duration ?? DSDurationTokens.l.duration,
    );
  }

  static void unimplemented([String message = 'Unimplemented']) {
    _toast(
      message,
      align: const Alignment(0, -0.86),
      color: Colors.purple,
      duration: DSDurationTokens.s.duration,
    );
  }
}
