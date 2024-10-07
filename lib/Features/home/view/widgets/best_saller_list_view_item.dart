import 'package:bookly_app/Core/Utils/app_router.dart';
import 'package:bookly_app/Core/Utils/linear_progress_lndicator.dart';
import 'package:bookly_app/Core/Utils/styls.dart';
import 'package:bookly_app/Features/home/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/view/widgets/book_rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSallerListViewItem extends StatelessWidget {
  const BestSallerListViewItem({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 135,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: AspectRatio(
                aspectRatio: 2.8 / 4,
                child: CachedNetworkImage(
                  placeholder: (context, url) =>
                      const DeterminateLinearProgressIndicator(
                    progress: 0.5,
                  ),
                  fit: BoxFit.fill,
                  imageUrl: bookModel.volumeInfo.imageLinks.thumbnail ?? '',
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .5,
                  child: Text(bookModel.volumeInfo.title!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Styls.textStyle20),
                ),
                const SizedBox(height: 1),
                Text(bookModel.volumeInfo.authors![0],
                    style: Styls.textStyle15),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Text('Free', style: Styls.textStyle018),
                    const SizedBox(width: 95),
                    BookRating(
                      rating: bookModel.volumeInfo.averageRating?.round() ?? 0,
                      count: bookModel.volumeInfo.ratingsCount ?? 0,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
