import 'package:get/get.dart';
import 'package:movie_flix_app/app/modules/landing_page/bindings/landing_page_binding.dart';
import 'package:movie_flix_app/app/modules/landing_page/views/landing_page_screen.dart';
import 'package:movie_flix_app/app/modules/movie_list/bindings/movie_list_binding.dart';
import 'package:movie_flix_app/app/modules/movie_list/views/movie_list_screen.dart';
import 'package:movie_flix_app/app/modules/top_rated/bindings/top_rated_binding.dart';
import 'package:movie_flix_app/app/modules/top_rated/views/top_rated_screen.dart';
import 'package:movie_flix_app/app/routes/app_routes.dart';

class Pages {
  static const initialRoute = AppRoutes.landingPage;
  static final routes = [
    GetPage(
        name: AppRoutes.movieList,
        page: () => MovieListScreen(),
        binding: MovieListBinding()),
    GetPage(
        name: AppRoutes.landingPage,
        page: () => LandingPageScreen(),
        binding: LandingPageBinding()),
    GetPage(
        name: AppRoutes.topRated,
        page: () => TopRatedScreen(),
        binding: TopRatedBinding()),
  ];
}
