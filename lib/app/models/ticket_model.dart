import 'package:equatable/equatable.dart';
import 'package:flutix/app/models/movie_model.dart';

class TicketModel extends Equatable {
  const TicketModel({
    this.movie = const MovieModel(),
    this.cinema = '',
    this.showtime = '',
    this.selectedDate = 0,
    this.seats = const [],
    this.ticketPrice = 0,
    this.transactionDate = 0,
    this.fee = 0,
    this.total = 0,
    this.orderId = '',
    this.userId = '',
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) => TicketModel(
        movie: MovieModel.fromJson(json['movie']),
        cinema: json['cinema'] ?? '',
        showtime: json['showtime'] ?? '',
        selectedDate: json['selected_date'] ?? 0,
        seats: json['seats'] ?? [],
        ticketPrice: json['ticket_price'] ?? 0,
        transactionDate: json['transaction_date'] ?? 0,
        fee: json['fee'] ?? 0,
        total: json['total'] ?? 0,
        orderId: json['order_id'] ?? '',
        userId: json['user_id'] ?? '',
      );

  final MovieModel movie;
  final String cinema;
  final String showtime;
  final int selectedDate;
  final List seats;
  final int ticketPrice;
  final int transactionDate;
  final int fee;
  final int total;
  final String orderId;
  final String userId;

  @override
  List<Object?> get props => [
        movie,
        cinema,
        showtime,
        selectedDate,
        seats,
        ticketPrice,
        transactionDate,
        fee,
        total,
        orderId,
        userId
      ];
}
