import 'package:flutix/app/modules/ticket_detail/controllers/ticket_detail_controller.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketDetailView extends GetView<TicketDetailController> {
  const TicketDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'Ticket Detail',
      child: Column(
        children: [],
      ),
    );
  }
}
