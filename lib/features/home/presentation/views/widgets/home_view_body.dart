import '../../../../../core/utils/styles.dart';
import 'best_seller_sliver_list.dart';
import 'home_app_bar.dart';
import 'featured_books_list_view_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
          child: HomeAppBar(),
        ),
        SizedBox(height: 30),
        Expanded(
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(child: FeaturedBooksListViewWidget()),
              const SliverToBoxAdapter(child: SizedBox(height: 50)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Text(
                    "Best Seller",
                    style: Styles.montserratSemiBold18,
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 15)),
              BestSellerSliverList(),
            ],
          ),
        ),
      ],
    );
  }
}
