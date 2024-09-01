import 'package:flutter/material.dart';

class ErrorMessageAtom extends StatelessWidget {
  const ErrorMessageAtom(
    this.errorMessage, {
    super.key,
  });

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      errorMessage,
      style:
          Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.red),
    );
  }
}
