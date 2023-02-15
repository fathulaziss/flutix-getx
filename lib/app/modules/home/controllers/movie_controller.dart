import 'package:flutix/app/api/api_movies.dart';
import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/app/controllers/utility_controller.dart';
import 'package:flutix/app/data/voucher_data.dart';
import 'package:flutix/app/models/movie_model.dart';
import 'package:flutix/app/models/voucher_model.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:get/get.dart';

class MovieController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();
  final cUtility = Get.find<UtilityController>();

  RxList<MovieModel> listMovieShowing = <MovieModel>[].obs;
  RxList<MovieModel> listMovieComingSoon = <MovieModel>[].obs;
  RxList<VoucherModel> listMovieVoucher = <VoucherModel>[].obs;

  double minimumRating = 6.5;

  RxBool isLoadingDataUser = false.obs;
  RxBool isLoadingMovie = false.obs;
  RxBool isLoadingMovieComingSoon = false.obs;
  RxBool isLoadingMovieVoucher = false.obs;

  @override
  void onInit() {
    getDataUser();
    getMovieShowing();
    getMovieComingSoon();
    getMovieVoucher();
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

  Future<void> getMovieShowing() async {
    try {
      isLoadingMovie(true);

      final response = await ApiMovies.getMovieShowing(
        language: cUtility.appLanguage.value,
        page: 1,
      );
      final int totalPages = response['total_pages'];
      final tempMovieShowing = <MovieModel>[];
      final dataMovieShowing = <MovieModel>[];

      for (var i = 1; i < totalPages;) {
        final res = await ApiMovies.getMovieShowing(
          language: cUtility.appLanguage.value,
          page: i,
        );

        final data = res['results'] as List;

        final dataFilter = data.where((item) {
          return DateTime.parse(item['release_date'])
                  .isBefore(DateTime.now()) &&
              item['vote_average'] >= minimumRating;
        }).toList();

        tempMovieShowing
            .addAll(dataFilter.map((e) => MovieModel.fromJson(e)).toList());
        i++;
      }

      tempMovieShowing.sort(
        (a, b) => DateTime.parse(b.releaseDate)
            .compareTo(DateTime.parse(a.releaseDate)),
      );

      dataMovieShowing
        ..addAll(tempMovieShowing.sublist(0, 10))
        ..sort((a, b) => b.popularity.compareTo(a.popularity));

      listMovieShowing(dataMovieShowing);

      isLoadingMovie(false);
    } catch (e) {
      isLoadingMovie(false);
      logSys(e.toString());
    }
  }

  Future<void> getMovieComingSoon() async {
    try {
      isLoadingMovieComingSoon(true);

      final response = await ApiMovies.getMovieComingSoon(
        language: cUtility.appLanguage.value,
        page: 1,
      );
      final int totalPages = response['total_pages'];
      final tempMovieComingSoon = <MovieModel>[];
      final dataMovieComingSoon = <MovieModel>[];

      for (var i = 1; i < totalPages;) {
        final res = await ApiMovies.getMovieComingSoon(
          language: cUtility.appLanguage.value,
          page: i,
        );

        final data = res['results'] as List;

        final dataFilter = data.where((item) {
          return DateTime.parse(item['release_date']).isAfter(DateTime.now());
        }).toList();

        tempMovieComingSoon
            .addAll(dataFilter.map((e) => MovieModel.fromJson(e)).toList());
        i++;
      }

      tempMovieComingSoon
        ..sort(
          (a, b) => DateTime.parse(b.releaseDate)
              .compareTo(DateTime.parse(a.releaseDate)),
        )
        ..sort((a, b) => b.popularity.compareTo(a.popularity));

      dataMovieComingSoon.addAll(tempMovieComingSoon.sublist(0, 10));

      listMovieComingSoon(dataMovieComingSoon);

      isLoadingMovieComingSoon(false);
    } catch (e) {
      isLoadingMovieComingSoon(false);
      logSys(e.toString());
    }
  }

  Future<void> getMovieVoucher() async {
    try {
      isLoadingMovieVoucher(true);

      final data = voucherData;
      listMovieVoucher(RxList.from(data.map((e) => VoucherModel.fromJson(e))));

      await Future.delayed(const Duration(seconds: 3));

      isLoadingMovieVoucher(false);
    } catch (e) {
      isLoadingMovieVoucher(false);
      logSys(e.toString());
    }
  }
}
