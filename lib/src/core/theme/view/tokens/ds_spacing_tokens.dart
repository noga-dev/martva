import 'package:flutter/material.dart';

enum DSSpacingTokens {
  none(0),
  xxxs(2),
  xxs(4),
  xs(6),
  s(8),
  m(10),
  l(12),
  xl(14),
  xxl(16),
  xxxl(18);

  const DSSpacingTokens(this.value);

  final double value;

  EdgeInsetsGeometry scaleBy(double scale) =>
      EdgeInsetsDirectional.all(value * scale);

  EdgeInsetsGeometry get allInsets => EdgeInsetsDirectional.all(value);

  EdgeInsetsGeometry get horizontalInsets =>
      EdgeInsetsDirectional.symmetric(horizontal: value);
  EdgeInsetsGeometry get verticalInsets =>
      EdgeInsetsDirectional.symmetric(vertical: value);

  EdgeInsetsGeometry get startInsets =>
      EdgeInsetsDirectional.only(start: value);
  EdgeInsetsGeometry get topInsets => EdgeInsetsDirectional.only(top: value);
  EdgeInsetsGeometry get endInsets => EdgeInsetsDirectional.only(end: value);
  EdgeInsetsGeometry get bottomInsets =>
      EdgeInsetsDirectional.only(bottom: value);

  SizedBox get horizontalBox => SizedBox(width: value);
  SizedBox get verticalBox => SizedBox(height: value);
  SizedBox get squareBox => SizedBox.square(dimension: value);
  SizedBox scaledHorizontalBox(double scale) => SizedBox(width: value * scale);
  SizedBox scaledVerticalBox(double scale) => SizedBox(height: value * scale);
  SizedBox scaledSquareBox(double scale) =>
      SizedBox.square(dimension: value * scale);
}
