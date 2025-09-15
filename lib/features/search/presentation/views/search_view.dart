import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:bookly/features/search/presentation/view_models/search_book_cubit/search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchBooksCubit(getIt.get<SearchRepo>()),
      child: SearchViewBody(),
    );
  }
}
