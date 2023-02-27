import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/app/models/ticket_model.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutix/utils/convert_type.dart';
import 'package:flutix/utils/format_date_time.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TicketController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  final collectionTicket =
      FirebaseFirestore.instance.collection('ticket_transactions');

  RxList<TicketModel> listTicketActive = <TicketModel>[].obs;

  RxList<TicketModel> listTicketComplete = <TicketModel>[].obs;

  RxBool isLoading = false.obs;

  Future<void> getTicket() async {
    try {
      isLoading(true);

      final result = await collectionTicket.get();

      await Future.delayed(const Duration(seconds: 2));

      if (result.docs.isNotEmpty) {
        final data = result.docs.where(
          (item) => item.data()['user_id'] == cUserInfo.dataUser.value.userId,
        );

        final ticketActive = data.where((item) {
          return checkTicketActive(
            DateTime.fromMillisecondsSinceEpoch(item.data()['selected_date']),
            item.data()['showtime'],
          );
        }).toList();

        final ticketComplete = data.where((item) {
          return !checkTicketActive(
            DateTime.fromMillisecondsSinceEpoch(item.data()['selected_date']),
            item.data()['showtime'],
          );
        }).toList();

        listTicketActive(
          RxList.from(ticketActive.map((e) => TicketModel.fromJson(e.data()))),
        );

        listTicketActive.sort(
          (a, b) => b.transactionDate.compareTo(a.transactionDate),
        );

        listTicketComplete(
          RxList.from(
            ticketComplete.map((e) => TicketModel.fromJson(e.data())),
          ),
        );

        listTicketComplete.sort(
          (a, b) => b.transactionDate.compareTo(a.transactionDate),
        );
      }

      isLoading(false);
    } catch (e) {
      isLoading(false);
      logSys(e.toString());
      rethrow;
    }
  }

  bool checkTicketActive(DateTime selectedDate, String showtime) {
    final dataShowtime = showtime.split(':');

    final dataShowtimeConvert = FormatDateTime.format(
      value: DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        ConvertType.toInt(dataShowtime[0]),
        ConvertType.toInt(dataShowtime[1]),
      ),
      format: DateFormat('yyyy-MM-dd HH:mm'),
    );

    return DateTime.now().isBefore(DateTime.parse(dataShowtimeConvert));
  }
}
