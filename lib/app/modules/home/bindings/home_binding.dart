// ignore_for_file: directives_ordering

import 'package:flutix/app/modules/home/controllers/home_controller.dart';
import 'package:flutix/app/modules/home/controllers/ticket_controller.dart';
import 'package:get/get.dart';
import 'package:flutix/app/modules/home/controllers/movie_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<HomeController>(() => HomeController())
      ..lazyPut<MovieController>(() => MovieController())
      ..lazyPut<TicketController>(() => TicketController());
  }
}
