import 'package:bookly_app/Core/Utils/styls.dart';
import 'package:bookly_app/Features/home/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/view/widgets/also_like_section.dart';
import 'package:bookly_app/Features/home/view/widgets/book_rating.dart';
import 'package:bookly_app/Features/home/view/widgets/books_actions.dart';
import 'package:flutter/material.dart';
import 'custom_list_view_item.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: ListViewItem(
            imageUrl: book.volumeInfo.imageLinks.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Text(
          book.volumeInfo.title ?? 'No Title Available',
          style: Styls.textStyle30,
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          book.volumeInfo.authors?.join(', ') ?? 'Unknown Author',
          style: Styls.textStyle020.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        BookRating(
          count: book.volumeInfo.ratingsCount ?? 0,
          rating: book.volumeInfo.averageRating?.toDouble() ?? 0.0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 40,
        ),
        BooksAction(
          bookModel: book,
        ),
        const SizedBox(
          height: 40,
        ),
        AlsoLikeSection(
          bookModel: book,
        ),
      ],
    );
  }
}
