import 'package:flutix/app/api/api_movies.dart';
import 'package:flutix/app/controllers/utility_controller.dart';
import 'package:flutix/app/models/movie_detail_model.dart';
import 'package:flutix/app/models/movie_model.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController {
  final cUtility = Get.find<UtilityController>();

  Rx<MovieModel> movieData = const MovieModel().obs;
  Rx<MovieDetailModel> movieDetailData = const MovieDetailModel().obs;

  RxBool isLoading = false.obs;

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
      isLoading(true);

      final response = await ApiMovies.getMovieDetail(
        language: cUtility.appLanguage.value,
        movieModel: movieData.value,
      );

      movieDetailData.value = MovieDetailModel.fromJson(response);

      isLoading(false);
    } catch (e) {
      isLoading(false);
      logSys(e.toString());
    }
  }
}
