import 'package:equatable/equatable.dart';
import 'package:flutix/utils/convert_type.dart';

class MovieModel extends Equatable {
  const MovieModel({
    this.adult = false,
    this.backdropPath = '',
    this.genreIds = const [],
    this.id = 0,
    this.originalLanguage = '',
    this.originalTitle = '',
    this.overview = '',
    this.popularity = 0,
    this.posterPath = '',
    this.releaseDate = '',
    this.title = '',
    this.video = false,
    this.voteAverage = 0,
    this.voteCount = 0,
  });

  factory MovieModel.fromJson(dynamic json) => MovieModel(
        adult: json['adult'] ?? false,
        backdropPath: json['backdrop_path'] ?? '',
        genreIds: json['genre_ids'] ?? [],
        id: json['id'] ?? 0,
        originalLanguage: json['original_language'] ?? '',
        originalTitle: json['original_title'] ?? '',
        overview: json['overview'] ?? '',
        popularity: json['popularity'] != null
            ? ConvertType.toDouble(json['popularity'])
            : 0,
        posterPath: json['poster_path'] ?? '',
        releaseDate: json['release_date'] ?? '${DateTime.now()}',
        title: json['title'] ?? '',
        video: json['video'] ?? false,
        voteAverage: json['vote_average'] != null
            ? ConvertType.toDouble(json['vote_average'])
            : 0,
        voteCount: json['vote_count'] ?? 0,
      );

  final bool adult;
  final String backdropPath;
  final List genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Map<String, dynamic> toJson() => {
        'adult': adult,
        'backdrop_path': backdropPath,
        'genre_ids': genreIds,
        'id': id,
        'original_language': originalLanguage,
        'original_title': originalTitle,
        'overview': overview,
        'popularity': popularity,
        'poster_path': posterPath,
        'release_date': releaseDate,
        'title': title,
        'video': video,
        'vote_average': voteAverage,
        'vote_count': voteCount,
      };

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genreIds,
        id,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
