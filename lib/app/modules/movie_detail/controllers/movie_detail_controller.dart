import 'package:flutix/app/api/api_movies.dart';
import 'package:flutix/app/controllers/utility_controller.dart';
import 'package:flutix/app/models/movie_model.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  final cUtility = Get.find<UtilityController>();

  Rx<MovieModel> movieData = const MovieModel().obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  Future<void> initData() async {
    final args = Get.arguments;
    if (args != null) {
      movieData.value = args['movie'];
      await getMovieDetail();
    }
  }

  Future<void> getMovieDetail() async {
    try {
      await ApiMovies.getMovieDetail(
        language: cUtility.appLanguage.value,
        movieModel: movieData.value,
      );
    } catch (e) {
      logSys(e.toString());
    }
  }
}
