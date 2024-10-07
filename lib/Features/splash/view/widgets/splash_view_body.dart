import 'package:bookly_app/Core/Utils/app_router.dart';
import 'package:bookly_app/Core/Utils/constants.dart';
import 'package:bookly_app/Features/splash/view/widgets/Animated_Image.dart';
import 'package:bookly_app/Features/splash/view/widgets/Animated_Text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    initAnimationFunction();
    NavigateToHome();
  }

  void NavigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }

  void initAnimationFunction() {
    _animationController = AnimationController(
      duration: kTranstionDuration,
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();

    Future.delayed(const Duration(seconds: 3), () {});
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedImage(animation: _animation),
            const SizedBox(height: 40),
            const Center(
              child: AnimatedTextWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
