import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:sample_flutter/assets_gen/assets.gen.dart';
import 'package:sample_flutter/home/home.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  static const routeName = 'splash';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(vsync: this);

  @override
  void initState() {
    _animationController.addListener(_onAnimationUpdate);
    super.initState();
  }

  @override
  void dispose() {
    _animationController.removeListener(_onAnimationUpdate);
    _animationController.dispose();
    super.dispose();
  }

  void _onAnimationUpdate() {
    if (_animationController.status == AnimationStatus.completed) {
      context.goNamed(HomePage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          Assets.animations.splashAnimation,
          controller: _animationController,
          onLoaded: (composition) {
            // Configure the AnimationController with the duration of the
            // Lottie file and start the animation.
            _animationController
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
    );
  }
}
