import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view_models/best_seller_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_sliver_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/featured_books_list_view_widget.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  static final List<BestSellerModel> bestSellerModels = [
    BestSellerModel(
      bookTitle: "Harry Potter and the Goblet of Fire",
      author: "J.K. Rowling",
      price: "19.99 €",
      rating: "4.8",
      reviews: "(2390)",
      image: AssetsData.books[0],
    ),
    BestSellerModel(
      bookTitle: "The Jungle Book",
      author: "Rudyard Kipling",
      price: "19.99 €",
      rating: "4.8",
      reviews: "(2390)",
      image: AssetsData.books[1],
    ),
    BestSellerModel(
      bookTitle: "Star Wars Return of the Jedi",
      author: "Greg Cox",
      price: "19.99 €",
      rating: "4.8",
      reviews: "(2390)",
      image: AssetsData.books[2],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          SizedBox(height: 15),
          HomeAppBar(),
          SizedBox(height: 15),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(child: FeaturedBooksListViewWidget()),
                const SliverToBoxAdapter(child: SizedBox(height: 50)),
                SliverToBoxAdapter(
                  child: Text(
                    "Best Seller",
                    style: Styles.montserratSemiBold18,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                BestSellerSliverList(bestSellerModels: bestSellerModels),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
