enum DSDurationTokens {
  xxxs,
  xxs,
  xs,
  s,
  m,
  l,
  xl,
  xxl,
  xxxl;

  Duration get duration {
    return switch (this) {
      DSDurationTokens.xxxs => const Duration(milliseconds: 300),
      DSDurationTokens.xxs => const Duration(milliseconds: 600),
      DSDurationTokens.xs => const Duration(milliseconds: 900),
      DSDurationTokens.s => const Duration(milliseconds: 1200),
      DSDurationTokens.m => const Duration(milliseconds: 1500),
      DSDurationTokens.l => const Duration(milliseconds: 1800),
      DSDurationTokens.xl => const Duration(milliseconds: 2100),
      DSDurationTokens.xxl => const Duration(milliseconds: 2400),
      DSDurationTokens.xxxl => const Duration(milliseconds: 2700),
    };
  }
}
