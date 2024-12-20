import 'package:flutter/material.dart';

class AnimationProvider extends ChangeNotifier {
  AnimationController? controller;
  Animation<double>? animation;

  // INITIALIZE ANIMATION
  void initAnimationController(TickerProvider vsync) {
    controller = AnimationController(
      vsync: vsync,
      duration: const Duration(seconds: 5),
    )..repeat(reverse: true);

    animation = CurvedAnimation(
      parent: controller!,
      curve: Curves.bounceInOut,
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
