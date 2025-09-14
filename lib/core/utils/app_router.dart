import '../../features/book_details/presentation/views/books_view.dart';
import '../models/book_model/book_model.dart';
import '../../features/home/presentation/views/home_view.dart';
import '../../features/search/presentation/views/search_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static final kSplashView = '/';
  static final kHomeView = '/home';
  static final kBooksView = '/books';
  static final kSearchView = '/search';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
        path: kSplashView,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kBooksView,
        builder:
            (context, state) => BooksView(bookModel: state.extra as BookModel),
      ),
    ],
  );
}
