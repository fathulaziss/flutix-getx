import 'package:equatable/equatable.dart';
import 'package:flutix/utils/convert_type.dart';

class CreditModel extends Equatable {
  const CreditModel({
    this.adult = false,
    this.gender = 1,
    this.id = 0,
    this.knownForDepartment = '',
    this.name = '',
    this.originalName = '',
    this.popularity = 0,
    this.profilePath = '',
    this.castId = 0,
    this.character = '',
    this.creditId = '',
    this.order = 0,
  });

  factory CreditModel.fromJson(Map<String, dynamic> json) => CreditModel(
        adult: json['adult'] ?? false,
        gender: json['gender'] ?? 1,
        id: json['id'] ?? 0,
        knownForDepartment: json['known_for_department'] ?? '',
        name: json['name'] ?? '',
        originalName: json['original_name'] ?? '',
        popularity: json['popularity'] != null
            ? ConvertType.toDouble(json['popularity'])
            : 0,
        profilePath: json['profile_path'] ?? '',
        castId: json['cast_id'] ?? 0,
        character: json['character'] ?? '',
        creditId: json['credit_id'] ?? '',
        order: json['order'] ?? 0,
      );

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [];
}
