import 'package:get/get.dart';
import 'package:movie_flix_app/app/modules/landing_page/controllers/landing_page_controller.dart';
import 'package:movie_flix_app/app/modules/movie_list/controllers/movie_list_controller.dart';
import 'package:movie_flix_app/app/modules/top_rated/controllers/top_rated_controller.dart';

class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingPageController>(() => LandingPageController());
    Get.lazyPut<MovieListController>(() => MovieListController());
    Get.lazyPut<TopRatedController>(() => TopRatedController());

  }
}
