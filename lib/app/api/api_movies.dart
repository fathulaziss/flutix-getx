import 'package:flutix/app/models/app_language_model.dart';
import 'package:flutix/app_config.dart';
import 'package:flutix/services/api_service.dart';

class ApiMovies {
  static Future<List> getMovies({
    required AppLanguageModel language,
    required int page,
  }) async {
    try {
      final url =
          'discover/movie?api_key=${AppConfig.apiKey}&language=${language.locale.languageCode}-${language.locale.countryCode}&sort_by=popularity.desc&include_adult=false&include_video=false&page=$page';

      final response = await ApiService().request(
        url: url,
        method: Method.GET,
        isToken: false,
      );

      final List data = response['results'];

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
