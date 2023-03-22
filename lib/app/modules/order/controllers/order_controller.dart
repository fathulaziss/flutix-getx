import 'package:flutix/app/data/showtime_data.dart';
import 'package:flutix/app/models/movie_detail_model.dart';
import 'package:flutix/app/models/movie_model.dart';
import 'package:flutix/app/models/showtime_model.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutix/utils/convert_type.dart';
import 'package:flutix/utils/format_date_time.dart';
import 'package:flutix/widgets/others/show_dialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderController extends GetxController {
  Rx<MovieModel> movieData = const MovieModel().obs;
  Rx<MovieDetailModel> movieDetailData = const MovieDetailModel().obs;

  RxList<DateTime> listDate = <DateTime>[].obs;
  Rx<DateTime> selectedDate = DateTime(DateTime.now().year).obs;

  RxList<ShowtimeModel> listShowtime = <ShowtimeModel>[].obs;
  RxString selectedCinema = ''.obs;
  RxString selectedShowtime = ''.obs;

  RxInt ticketPrice = 0.obs;

  RxBool isValidSchedule = false.obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    final args = Get.arguments;

    if (args != null) {
      movieData.value = args['movie_data'];
      movieDetailData.value = args['movie_detail_data'];
    }

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
      await getTicketPrice();
    } catch (e) {
      logSys(e.toString());
    }
  }

  void setDate(DateTime value) {
    selectedDate(value);
    selectedCinema('');
    selectedShowtime('');
    getTicketPrice();
    validateSchedule();
  }

  Future<void> getTicketPrice() async {
    try {
      final data = selectedDate.value.weekday;
      switch (data) {
        case 1:
          ticketPrice(35000);
          break;
        case 2:
          ticketPrice(35000);
          break;
        case 3:
          ticketPrice(35000);
          break;
        case 4:
          ticketPrice(35000);
          break;
        case 5:
          ticketPrice(40000);
          break;
        default:
          ticketPrice(50000);
      }
    } catch (e) {
      logSys(e.toString());
    }
  }

  Future<void> getShowtimes() async {
    try {
      final data = showtimeData;
      listShowtime(RxList.from(data.map(ShowtimeModel.fromJson)));
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

  void onSubmit() {
    if (isValidSchedule.value && availShowtime(selectedShowtime.value)) {
      Get.toNamed(Routes.ORDER_SEAT);
    } else {
      showPopUpInfo(
        title: 'sorry'.tr,
        description: 'showtimeEnded'.tr,
        onPress: () {
          setShowtime(cinema: '', showtime: '');
          Get.back();
        },
      );
    }
  }
}
