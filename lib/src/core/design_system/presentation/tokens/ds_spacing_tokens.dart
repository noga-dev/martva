import 'package:flutter/material.dart';

enum DSSpacingTokens {
  xs(4),
  s(8),
  m(12),
  l(16),
  xl(20);

  const DSSpacingTokens(this.value);

  final double value;

  EdgeInsetsDirectional get all => EdgeInsetsDirectional.all(value);

  EdgeInsetsDirectional get horizontal =>
      EdgeInsetsDirectional.symmetric(horizontal: value);
  EdgeInsetsDirectional get vertical =>
      EdgeInsetsDirectional.symmetric(vertical: value);

  EdgeInsetsDirectional get start => EdgeInsetsDirectional.only(start: value);
  EdgeInsetsDirectional get top => EdgeInsetsDirectional.only(top: value);
  EdgeInsetsDirectional get end => EdgeInsetsDirectional.only(end: value);
  EdgeInsetsDirectional get bottom => EdgeInsetsDirectional.only(bottom: value);

  SizedBox get horizontalSpace => SizedBox(width: value);
  SizedBox get verticalSpace => SizedBox(height: value);
}
