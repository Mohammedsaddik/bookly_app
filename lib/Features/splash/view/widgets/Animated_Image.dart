import 'package:flutter/material.dart';

class AnimatedImage extends StatelessWidget {
  const AnimatedImage({
    super.key,
    required Animation<double> animation,
  }) : _animation = animation;

  final Animation<double> _animation;

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: Image.asset(
        'assets/images/Logo.png',
        height: 65,
      ),
    );
  }
}
