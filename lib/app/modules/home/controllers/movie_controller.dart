import 'package:flutix/app/api/api_movies.dart';
import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/app/controllers/utility_controller.dart';
import 'package:flutix/app/models/movie_model.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();
  final cUtility = Get.find<UtilityController>();

  RxList<MovieModel> listMovieShowing = <MovieModel>[].obs;
  RxList<MovieModel> listMovieComingSoon = <MovieModel>[].obs;

  RxBool isLoadingDataUser = false.obs;
  RxBool isLoadingMovie = false.obs;

  @override
  void onInit() {
    getDataUser();
    getMovies();
    super.onInit();
  }

  Future<void> getDataUser() async {
    try {
      isLoadingDataUser(true);

      await cUserInfo.getDataUser();
      await Future.delayed(const Duration(seconds: 2));

      isLoadingDataUser(false);
    } catch (e) {
      isLoadingDataUser(false);
      logSys(e.toString());
    }
  }

  Future<void> getMovies() async {
    try {
      isLoadingMovie(true);

      final data = await ApiMovies.getMovies(
        language: cUtility.appLanguage.value,
        page: 1,
      );

      final dataMoviePlaying = data.sublist(0, 10);
      final dataMovieComingSoon = data.sublist(10);

      listMovieShowing(
        RxList.from(dataMoviePlaying.map((e) => MovieModel.fromJson(e))),
      );
      listMovieComingSoon(
        RxList.from(dataMovieComingSoon.map((e) => MovieModel.fromJson(e))),
      );

      await Future.delayed(const Duration(seconds: 1));

      isLoadingMovie(false);
    } catch (e) {
      isLoadingMovie(false);
      logSys(e.toString());
    }
  }
}
