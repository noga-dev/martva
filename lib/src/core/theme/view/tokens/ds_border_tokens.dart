enum DSBorderTokens {
  none(0),
  xs(1),
  s(2),
  m(4),
  l(8),
  xl(16),
  xxl(32);

  const DSBorderTokens(this.value);

  final double value;
}
