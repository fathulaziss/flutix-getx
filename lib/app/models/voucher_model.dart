import 'package:equatable/equatable.dart';

class VoucherModel extends Equatable {
  const VoucherModel({
    this.title = '',
    this.desc = '',
    this.discount = 0,
  });

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        title: json['title'],
        desc: json['desc'],
        discount: json['discount'],
      );

  final String title;
  final String desc;
  final int discount;

  Map<String, dynamic> toJson() => {
        'title': title,
        'desc': desc,
        'discount': discount,
      };

  @override
  List<Object?> get props => [title, desc, discount];
}
