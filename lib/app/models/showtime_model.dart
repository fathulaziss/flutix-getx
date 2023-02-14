import 'package:equatable/equatable.dart';

class ShowtimeModel extends Equatable {
  const ShowtimeModel({this.cinema = '', this.schedule = const []});

  factory ShowtimeModel.fromJson(Map<String, dynamic> json) => ShowtimeModel(
        cinema: json['cinema'],
        schedule: json['schedule'],
      );

  final String cinema;
  final List<String> schedule;

  Map<String, dynamic> toJson() => {
        'cinema': cinema,
        'schedule': schedule,
      };

  @override
  List<Object?> get props => [cinema, schedule];
}
