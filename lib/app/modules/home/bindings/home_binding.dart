import 'package:flutix/app/modules/home/controllers/home_controller.dart';
import 'package:flutix/app/modules/home/controllers/movie_controller.dart';
import 'package:flutix/app/modules/home/controllers/ticket_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<HomeController>(HomeController.new)
      ..lazyPut<MovieController>(MovieController.new)
      ..lazyPut<TicketController>(TicketController.new);
  }
}
