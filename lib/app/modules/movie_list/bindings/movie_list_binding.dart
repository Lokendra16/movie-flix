import 'package:get/get.dart';
import 'package:movie_flix_app/app/modules/movie_list/controllers/movie_list_controller.dart';

class MovieListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieListController>(() => MovieListController());
  }
}
