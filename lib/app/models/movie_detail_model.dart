import 'package:equatable/equatable.dart';
import 'package:flutix/app/models/genre_model.dart';
import 'package:flutix/utils/convert_type.dart';

class MovieDetailModel extends Equatable {
  const MovieDetailModel({
    this.adult = false,
    this.backdropPath = '',
    this.genres = const <GenreModel>[],
    this.homepage = '',
    this.id = 0,
    this.imdbId = '',
    this.originalLanguage = '',
    this.originalTitle = '',
    this.overview = '',
    this.popularity = 0,
    this.posterPath = '',
    this.releaseDate = '',
    this.revenue = 0,
    this.runtime = 0,
    this.status = '',
    this.tagline = '',
    this.title = '',
    this.video = false,
    this.voteAverage = 0,
    this.voteCount = 0,
  });

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
        adult: json['adult'] ?? false,
        backdropPath: json['backdrop_path'] ?? '',
        genres: json['genres'] != null
            ? (json['genres'] as List).map(GenreModel.fromJson).toList()
            : [],
        homepage: json['homepage'] ?? '',
        id: json['id'] ?? 0,
        imdbId: json['imdb_id'] ?? '',
        originalLanguage: json['original_language'] ?? '',
        originalTitle: json['original_title'] ?? '',
        overview: json['overview'] ?? '',
        popularity: json['popularity'] != null
            ? ConvertType.toDouble(json['popularity'])
            : 0,
        posterPath: json['poster_path'] ?? '',
        releaseDate: json['release_date'] ?? '',
        revenue: json['revenue'] ?? 0,
        runtime: json['runtime'] ?? 0,
        status: json['status'] ?? '',
        tagline: json['tagline'] ?? '',
        title: json['title'] ?? '',
        video: json['video'] ?? false,
        voteAverage: json['vote_average'] != null
            ? ConvertType.toDouble(json['vote_average'])
            : 0,
        voteCount: json['vote_count'] ?? 0,
      );

  final bool adult;
  final String backdropPath;
  final List<GenreModel> genres;
  final String homepage;
  final int id;
  final String imdbId;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final String releaseDate;
  final int revenue;
  final int runtime;
  final String status;
  final String tagline;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        adult,
        backdropPath,
        genres,
        homepage,
        id,
        imdbId,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        revenue,
        runtime,
        status,
        tagline,
        title,
        video,
        voteAverage,
        voteCount,
      ];
}
