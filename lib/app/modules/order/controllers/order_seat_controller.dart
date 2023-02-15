import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderSeatController extends GetxController {
  RxString test = 'hubla'.obs;
  List<int> numberofSeats = [19, 19, 19, 19, 19, 19, 19, 16];
  RxList<Widget> listSeat = <Widget>[].obs;

  @override
  void onInit() {
    getSeat();
    super.onInit();
  }

  void getSeat() {
    final listSeatTemp = <Widget>[];
    for (var i = numberofSeats.length - 1; i >= 0; i--) {
      listSeatTemp.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            numberofSeats[i],
            (index) => Padding(
              padding: EdgeInsets.only(
                right: index < numberofSeats[i] - 1 ? 12.w : 0,
                bottom: 12.w,
              ),
              child: CardApp(
                width: 30.w,
                height: 30.w,
                constraints: BoxConstraints(minHeight: 30.w, minWidth: 30.w),
                color: AppColor.primaryColor1,
                padding: EdgeInsets.zero,
                radius: 6.w,
                child: Center(
                  child: Text(
                    '${String.fromCharCode(i + 65)}${index + 1}',
                    style: TextStyles.desc.copyWith(
                      fontSize: 10.w,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
    listSeat.addAll(listSeatTemp);
  }
}
