import 'package:bookly_app/Features/home/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/view/widgets/books_details_sectioni.dart';
import 'package:bookly_app/Features/home/view/widgets/custom_book_details_app_bar.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                const Expanded(
                  child: SizedBox(
                    height: 50,
                  ),
                ),
                BookDetailsSection(
                  book: bookModel,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
