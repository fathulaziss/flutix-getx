import 'dart:ui';

class AppLanguageModel {
  AppLanguageModel({
    this.language = 'EN',
    this.locale = const Locale('en', 'US'),
  });

  factory AppLanguageModel.fromJson(Map<String, dynamic> json) =>
      AppLanguageModel(
        language: json['language'],
        locale: Locale(
          json['locale']['language_code'],
          json['locale']['country_code'],
        ),
      );

  final String language;
  final Locale locale;

  Map<String, dynamic> toJson() => {
        'language': language,
        'locale': locale,
      };
}
