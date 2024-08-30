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

  EdgeInsetsDirectional scaleBy(double scale) =>
      EdgeInsetsDirectional.all(value * scale);

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
  SizedBox get squareSpace => SizedBox.square(dimension: value);
  SizedBox scaledHorizontalSpace(double scale) =>
      SizedBox(width: value * scale);
  SizedBox scaledVerticalSpace(double scale) => SizedBox(height: value * scale);
  SizedBox scaledSquareSpace(double scale) =>
      SizedBox.square(dimension: value * scale);
}
