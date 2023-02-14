import 'package:flutix/app/data/showtime_data.dart';
import 'package:flutix/app/models/showtime_model.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  RxList<DateTime> listDate = <DateTime>[].obs;
  Rx<DateTime> selectedDate = DateTime(DateTime.now().year).obs;

  RxList<ShowtimeModel> listShowtime = <ShowtimeModel>[].obs;
  RxString selectedCinema = ''.obs;
  RxString selectedShowtime = ''.obs;

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

  void setDate(DateTime value) => selectedDate(value);

  Future<void> getShowtimes() async {
    try {
      final data = showtimeData;
      listShowtime(RxList.from(data.map((e) => ShowtimeModel.fromJson(e))));
    } catch (e) {
      logSys(e.toString());
    }
  }

  void setCinema(String value) => selectedCinema(value);

  void setShowtime(String value) {
    selectedShowtime(value);
  }

  bool availShowtime() {
    return false;
  }
}
