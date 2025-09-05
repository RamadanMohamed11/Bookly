import 'package:bookly/core/utils/assets_data.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view_models/best_seller_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
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
          CustomAppBar(),
          SizedBox(height: 15),
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                const SliverToBoxAdapter(child: ListViewWidget()),
                const SliverToBoxAdapter(child: SizedBox(height: 50)),
                SliverToBoxAdapter(
                  child: Text(
                    "Best Seller",
                    style: Styles.montserratSemiBold18,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 15)),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: HomeViewBody.bestSellerModels.length,
                    (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: BestSellerWidget(
                          bestSellerModel: HomeViewBody.bestSellerModels[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BestSellerWidget extends StatelessWidget {
  const BestSellerWidget({super.key, required this.bestSellerModel});
  final BestSellerModel bestSellerModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
            child: Image.asset(bestSellerModel.image, fit: BoxFit.fitHeight),
          ),
        ),
        SizedBox(width: 30),

        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bestSellerModel.bookTitle,
                style: Styles.gTsectraFineRegular20,
              ),
              SizedBox(width: 5),
              Text(bestSellerModel.author, style: Styles.montserratMedium14),
              SizedBox(width: 5),
              Row(
                children: [
                  Text(bestSellerModel.price, style: Styles.montserratBold20),
                  Spacer(),
                  Icon(Icons.star, color: Color(0xffFFDD4F)),
                  SizedBox(width: 4.2),
                  Text(
                    bestSellerModel.rating,
                    style: Styles.montserratMedium16,
                  ),
                  SizedBox(width: 7),

                  Text(
                    bestSellerModel.reviews,
                    style: Styles.montserratRegular14,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AssetsData.books.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(AssetsData.books[index]),
          );
        },
      ),
    );
  }
}
