import 'package:flutix/app/modules/browse_movie/controllers/browse_movie_controller.dart';
import 'package:get/get.dart';

class BrowseMovieBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BrowseMovieController>(() => BrowseMovieController());
  }
}
