import 'package:bookly_app/Core/Utils/styls.dart';
import 'package:bookly_app/Features/home/model/book_model/book_model.dart';
import 'package:bookly_app/Features/home/view/widgets/also_like_list_view.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AlsoLikeSection extends StatelessWidget {
  const AlsoLikeSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Align(
            alignment: Alignment.centerLeft,
            child: Text('You can also like', style: Styls.textStyle14)),
        const SizedBox(height: 15),
        GestureDetector(
            onTap: () async {
              final Uri url = Uri.parse(
                  bookModel.volumeInfo.previewLink!); // قم بتغيير الرابط هنا
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: const AlsoLikeListView()),
      ],
    );
  }
}
