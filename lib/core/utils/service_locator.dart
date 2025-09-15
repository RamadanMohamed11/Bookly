import 'package:bookly/features/book_details/data/repo/book_details_repo.dart';
import 'package:bookly/features/book_details/data/repo/book_details_repo_impl.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:bookly/features/search/data/repos/search_repo_impl.dart';

import 'api_service.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/home/data/repos/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));

  getIt.registerSingleton<HomeRepo>(HomeRepoImpl(getIt.get<ApiService>()));

  getIt.registerSingleton<BookDetailsRepo>(
    BookDetailsRepoImpl(getIt.get<ApiService>()),
  );

  getIt.registerSingleton<SearchRepo>(SearchRepoImpl(getIt.get<ApiService>()));
}
