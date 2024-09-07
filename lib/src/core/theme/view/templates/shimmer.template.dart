import 'package:flutter/material.dart';
import 'package:martva/src/core/theme/view/tokens/ds_duration_tokens.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ShimmerTemplate extends StatelessWidget {
  const ShimmerTemplate({
    super.key,
    required this.child,
    required this.enabled,
  });

  final Widget child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: enabled,
      enableSwitchAnimation: true,
      switchAnimationConfig: SwitchAnimationConfig(
        duration: DSDurationTokens.xxs.duration,
        reverseDuration: DSDurationTokens.xxs.duration,
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
      ),
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade800,
        highlightColor: Colors.grey.shade100,
        duration: DSDurationTokens.xxs.duration,
      ),
      child: child,
    );
  }
}
