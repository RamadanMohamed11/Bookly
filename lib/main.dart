import 'package:bookly/features/book_details/data/repo/book_details_repo.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/home_repo.dart';
import 'features/home/presentation/view_models/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentation/view_models/newest_books_cubit/newest_books_cubit.dart';
import 'features/book_details/presentation/view_models/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeaturedBooksCubit>(
          create:
              (context) =>
                  FeaturedBooksCubit(getIt.get<HomeRepo>())
                    ..fetchFeaturedBooks(),
        ),
        BlocProvider<NewestBooksCubit>(
          create:
              (context) =>
                  NewestBooksCubit(getIt.get<HomeRepo>())..fetchNewestBooks(),
        ),
      ],
      child: MaterialApp.router(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
