import 'package:flutix/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:get/get.dart';

class MovieDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieDetailController>(MovieDetailController.new);
  }
}
