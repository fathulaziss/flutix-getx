import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutix/app/controllers/user_info_controller.dart';
import 'package:flutix/app/models/user_model.dart';
import 'package:flutix/app/modules/order/controllers/order_controller.dart';
import 'package:flutix/app/modules/order/controllers/order_seat_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutix/widgets/others/show_dialog.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class OrderConfirmController extends GetxController {
  final cOrder = Get.find<OrderController>();
  final cOrderSeat = Get.find<OrderSeatController>();
  final cUserInfo = Get.find<UserInfoController>();

  RxString orderId = ''.obs;
  RxInt totalPrice = 0.obs;

  RxBool isLoading = false.obs;

  int fee = 1500;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    final totalFee = fee * cOrderSeat.selectedSeats.length;
    final totalTicketPrice =
        cOrder.ticketPrice.value * cOrderSeat.selectedSeats.length;

    totalPrice(totalTicketPrice + totalFee);
    orderId(randomAlphaNumeric(12).toUpperCase());
  }

  Future<void> submit() async {
    if (cUserInfo.dataUser.value.balance > totalPrice.value) {
      if (cOrder.availShowtime(cOrder.selectedShowtime.value)) {
        final pin = await Get.toNamed(Routes.PIN);
        if (pin != null) {
          await payment();
        }
      } else {
        showPopUpInfo(
          title: 'sorry'.tr,
          description: 'showtimeEnded'.tr,
          onPress: () {
            cOrder.setShowtime(cinema: '', showtime: '');
            Get
              ..back()
              ..back()
              ..back();
          },
        );
      }
    } else {
      await Get.toNamed(Routes.TOPUP);
    }
  }

  Future<void> payment() async {
    try {
      isLoading(true);
      final collectionTicketTransaction =
          FirebaseFirestore.instance.collection('ticket_transactions');
      final collectionTransaction =
          FirebaseFirestore.instance.collection('transactions');

      await Future.delayed(const Duration(seconds: 2));

      await collectionTicketTransaction.add({
        'cinema': cOrder.selectedCinema.value,
        'showtime': cOrder.selectedShowtime.value,
        'selected_date': cOrder.selectedDate.value,
        'seats': cOrderSeat.selectedSeats,
        'ticket_price': cOrder.ticketPrice.value,
        'transaction_date': DateTime.now().millisecondsSinceEpoch,
        'fee': fee,
        'total': totalPrice.value,
        'order_id': orderId.value,
        'user_id': cUserInfo.dataUser.value.userId,
      });

      await collectionTransaction.add({
        'transaction_type': 'Ticket',
        'title': cOrder.movieData.value.title,
        'amount': totalPrice.value,
        'transaction_date': DateTime.now().millisecondsSinceEpoch,
        'user_id': cUserInfo.dataUser.value.userId,
      });

      final dataUser = UserModel(
        balance: cUserInfo.dataUser.value.balance - totalPrice.value,
        dateOfBirth: cUserInfo.dataUser.value.dateOfBirth,
        email: cUserInfo.dataUser.value.email,
        fullName: cUserInfo.dataUser.value.fullName,
        imageProfile: cUserInfo.dataUser.value.imageProfile,
        pinTransaction: cUserInfo.dataUser.value.pinTransaction,
        userId: cUserInfo.dataUser.value.userId,
      );

      await cUserInfo.updateDataUser(data: dataUser);
      await cUserInfo.getDataUser();

      isLoading(false);

      await Get.offAllNamed(Routes.ORDER_SUCCESS);
    } catch (e) {
      isLoading(false);
      logSys(e.toString());
    }
  }
}
