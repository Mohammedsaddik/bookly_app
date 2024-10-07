import 'package:bookly_app/Features/home/modelview/best_saller_books_cubit/best_saller_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'best_saller_list_view_item.dart';

class BestSallerListView extends StatelessWidget {
  const BestSallerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSallerBooksCubit, BestSallerBooksState>(
      builder: (context, state) {
        if (state is BestSallerBooksLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is BestSallerBooksSuccess) {
          return Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BestSallerListViewItem(
                    bookModel: state.books[index],
                  ),
                );
              },
            ),
          );
        } else if (state is BestSallerBooksError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }
}
