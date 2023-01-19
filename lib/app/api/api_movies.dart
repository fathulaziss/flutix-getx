import 'package:flutix/app/models/app_language_model.dart';
import 'package:flutix/app/models/movie_model.dart';
import 'package:flutix/app_config.dart';
import 'package:flutix/services/api_service.dart';

class ApiMovies {
  static Future<Map<String, dynamic>> getMovieShowing({
    required AppLanguageModel language,
    required int page,
  }) async {
    try {
      final url =
          'movie/now_playing?api_key=${AppConfig.apiKey}&language=${language.locale.languageCode}-${language.locale.countryCode}&page=$page';

      final response = await ApiService().request(
        url: url,
        method: Method.GET,
        isToken: false,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getMovieComingSoon({
    required AppLanguageModel language,
    required int page,
  }) async {
    try {
      final url =
          'movie/upcoming?api_key=${AppConfig.apiKey}&language=${language.locale.languageCode}-${language.locale.countryCode}&page=$page';

      final response = await ApiService().request(
        url: url,
        method: Method.GET,
        isToken: false,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }

  static Future<Map<String, dynamic>> getMovieDetail({
    required AppLanguageModel language,
    required MovieModel movieModel,
  }) async {
    try {
      final url =
          'movie/${movieModel.id}?api_key=${AppConfig.apiKey}&language=${language.locale.languageCode}-${language.locale.countryCode}';

      final response = await ApiService().request(
        url: url,
        method: Method.GET,
        isToken: false,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
