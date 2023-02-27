import 'package:flutix/app/models/ticket_model.dart';
import 'package:flutix/utils/convert_type.dart';
import 'package:flutix/utils/format_date_time.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TicketDetailController extends GetxController {
  Rx<TicketModel> data = const TicketModel().obs;
  RxBool isTicketActive = false.obs;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args != null) {
      data.value = args['data'];
    }
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}

  void checkTicketActive() {
    final dataShowtime = data.value.showtime.split(':');
    final selectedDate =
        DateTime.fromMillisecondsSinceEpoch(data.value.selectedDate);

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
    isTicketActive(
      DateTime.now().isBefore(DateTime.parse(dataShowtimeConvert)),
    );
  }
}
