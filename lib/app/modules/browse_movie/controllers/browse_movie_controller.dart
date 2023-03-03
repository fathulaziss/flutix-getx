import 'package:flutix/app/models/movie_model.dart';
import 'package:flutix/app/modules/home/controllers/movie_controller.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:get/get.dart';

class BrowseMovieController extends GetxController {
  final cMovie = Get.find<MovieController>();

  RxList<MovieModel> listBrowseMovie = <MovieModel>[].obs;
  RxInt genreId = 0.obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    final args = Get.arguments;
    if (args != null) {
      genreId(args['genre_id']);
      getBrowseMovie();
    }
  }

  Future<void> getBrowseMovie() async {
    try {
      isLoading(true);

      for (final data in cMovie.listMovieShowing) {
        if (data.genreIds.contains(genreId.value)) {
          listBrowseMovie.add(data);
        }
      }

      for (final data in cMovie.listMovieComingSoon) {
        if (data.genreIds.contains(genreId.value)) {
          listBrowseMovie.add(data);
        }
      }

      isLoading(false);
    } catch (e) {
      isLoading(false);
      logSys(e.toString());
    }
  }
}
