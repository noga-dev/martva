enum DSSizeTokens {
  xxxs(16),
  xxs(20),
  xs(24),
  s(28),
  m(32),
  l(36),
  xl(40),
  xxl(44),
  xxxl(48);

  const DSSizeTokens(this.value);

  final double value;

  double scaleBy(double scale) => value * scale;
}
