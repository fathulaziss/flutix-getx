import 'package:equatable/equatable.dart';

class GenreModel extends Equatable {
  const GenreModel({
    this.id = 0,
    this.name = '',
  });

  factory GenreModel.fromJson(dynamic json) => GenreModel(
        id: json['id'],
        name: json['name'],
      );

  final int id;
  final String name;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  @override
  List<Object?> get props => [id, name];
}
