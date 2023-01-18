import 'package:flutix/app/api/api_movies.dart';
import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/app/controllers/utility_controller.dart';
import 'package:flutix/app/models/movie_model.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();
  final cUtility = Get.find<UtilityController>();

  RxList<MovieModel> listMoviePlaying = <MovieModel>[].obs;

  RxBool isLoadingDataUser = false.obs;
  RxBool isLoadingMoviePlaying = false.obs;

  @override
  void onInit() {
    getDataUser();
    getPlayingMovie();
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

  Future<void> getPlayingMovie() async {
    try {
      isLoadingMoviePlaying(true);

      final data = await ApiMovies.getMovies(
        language: cUtility.appLanguage.value,
        page: 1,
      );

      final dataShortlist = data.sublist(0, 10);

      listMoviePlaying(
        RxList.from(dataShortlist.map((e) => MovieModel.fromJson(e))),
      );

      await Future.delayed(const Duration(seconds: 1));

      isLoadingMoviePlaying(false);
    } catch (e) {
      isLoadingMoviePlaying(false);
      logSys(e.toString());
    }
  }
}
