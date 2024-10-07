
import 'package:bookly_app/Features/home/view/widgets/best_saller_list_view.dart';
import 'package:bookly_app/Features/home/view/widgets/custom_feature_list_view.dart';
import 'package:flutter/material.dart';
import 'package:bookly_app/Core/Utils/styls.dart';
import 'package:bookly_app/Features/home/view/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const CustomAppBar(
                   
                  ),
                  const SizedBox(height: 20),
                  const FeaturedBooksListView(),
                  const SizedBox(height: 30),
                  const Text(
                    "Best Seller",
                    style: Styls.heading1,
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          const SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: BestSallerListView(),
            ),
          ),
        ],
      ),
    );
  }

  
}
