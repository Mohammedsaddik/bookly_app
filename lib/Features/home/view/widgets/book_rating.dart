import 'package:bookly_app/Core/Utils/styls.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final num rating;
  final int count;

  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(Icons.star, color: Colors.yellow, size: 16),
        const SizedBox(width: 4), // Add spacing between icon and text
        Text(rating.toString(), style: Styls.textStyle18),
        const SizedBox(width: 8),
        Text('($count)', style: Styls.textStyle18),
      ],
    );
  }
}
