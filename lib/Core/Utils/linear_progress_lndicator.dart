import 'package:flutter/material.dart';

class DeterminateLinearProgressIndicator extends StatelessWidget {
  final double progress;

  const DeterminateLinearProgressIndicator({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LinearProgressIndicator(
              value: progress, // Value should be between 0.0 and 1.0
              backgroundColor: Colors.grey[300], // Custom background color
              valueColor: const AlwaysStoppedAnimation<Color>(
                  Colors.green), // Custom progress color
            ),
            const SizedBox(height: 20),
            Text('Progress: ${(progress * 100).toStringAsFixed(0)}%'),
          ],
        ),
      ),
    );
  }
}
