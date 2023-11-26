import 'package:get/get.dart';
import 'package:movie_flix_app/app/modules/top_rated/controllers/top_rated_controller.dart';

class TopRatedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopRatedController>(() => TopRatedController());
  }
}
