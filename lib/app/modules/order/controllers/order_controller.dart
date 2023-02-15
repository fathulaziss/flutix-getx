import 'package:flutix/app/data/showtime_data.dart';
import 'package:flutix/app/models/showtime_model.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutix/utils/convert_type.dart';
import 'package:flutix/utils/format_date_time.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderController extends GetxController {
  RxList<DateTime> listDate = <DateTime>[].obs;
  Rx<DateTime> selectedDate = DateTime(DateTime.now().year).obs;

  RxList<ShowtimeModel> listShowtime = <ShowtimeModel>[].obs;
  RxString selectedCinema = ''.obs;
  RxString selectedShowtime = ''.obs;

  RxBool isValidSchedule = false.obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  // @override
  // void onReady() {
  //   super.onReady();
  // }

  // @override
  // void onClose() {}

  void initData() {
    getDates();
    getShowtimes();
  }

  Future<void> getDates() async {
    try {
      final data = List.generate(
        7,
        (index) => DateTime.now().add(Duration(days: index)),
      );
      listDate(data);
      selectedDate.value = listDate[0];
    } catch (e) {
      logSys(e.toString());
    }
  }

  void setDate(DateTime value) {
    selectedDate(value);
    selectedCinema('');
    selectedShowtime('');
    validateSchedule();
  }

  Future<void> getShowtimes() async {
    try {
      final data = showtimeData;
      listShowtime(RxList.from(data.map((e) => ShowtimeModel.fromJson(e))));
    } catch (e) {
      logSys(e.toString());
    }
  }

  void setShowtime({required String cinema, required String showtime}) {
    selectedCinema(cinema);
    selectedShowtime(showtime);
    validateSchedule();
  }

  bool availShowtime(String showtime) {
    final dataShowtime = showtime.split(':');

    final dataShowtimeConvert = FormatDateTime.format(
      value: DateTime(
        selectedDate.value.year,
        selectedDate.value.month,
        selectedDate.value.day,
        ConvertType.toInt(dataShowtime[0]),
        ConvertType.toInt(dataShowtime[1]),
      ),
      format: DateFormat('yyyy-MM-dd HH:mm'),
    );

    return DateTime.now().isBefore(DateTime.parse(dataShowtimeConvert));
  }

  void validateSchedule() {
    if (selectedCinema.value.isNotEmpty && selectedShowtime.value.isNotEmpty) {
      isValidSchedule(true);
    } else {
      isValidSchedule(false);
    }
  }
}
