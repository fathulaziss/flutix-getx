import 'package:flutix/app/models/showtime_model.dart';
import 'package:flutix/app/modules/order/components/order_showtime_card.dart';
import 'package:flutix/app/modules/order/controllers/order_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderShowtimeItem extends GetView<OrderController> {
  const OrderShowtimeItem({super.key, required this.data});

  final ShowtimeModel data;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return OrderShowtimeCard(
        cinemaName: data.cinema,
        ticketPrice: controller.ticketPrice.value,
        cinemaSchedule: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 24.w),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 2.5,
            mainAxisSpacing: 12.w,
            crossAxisSpacing: 12.w,
          ),
          itemCount: data.schedule.length,
          itemBuilder: (context, index) {
            return Obx(() {
              return InkWell(
                onTap: () {
                  if (controller.availShowtime(data.schedule[index])) {
                    controller.setShowtime(
                      cinema: data.cinema,
                      showtime: data.schedule[index],
                    );
                  }
                },
                child: CardApp(
                  padding: EdgeInsets.zero,
                  radius: Insets.xs,
                  color: controller.selectedCinema.value == data.cinema &&
                          controller.selectedShowtime.value ==
                              data.schedule[index]
                      ? AppColor.primaryColor1
                      : controller.availShowtime(data.schedule[index])
                          ? AppColor.backgroundColor1
                          : AppColor.disabledColor2,
                  isOutlined: true,
                  outlineColor:
                      controller.selectedCinema.value == data.cinema &&
                              controller.selectedShowtime.value ==
                                  data.schedule[index]
                          ? AppColor.primaryColor1
                          : AppColor.disabledColor2,
                  child: Center(
                    child: Text(
                      data.schedule[index],
                      style: TextStyles.desc.copyWith(
                        fontWeight: FontWeight.bold,
                        color: controller.selectedCinema.value == data.cinema &&
                                controller.selectedShowtime.value ==
                                    data.schedule[index]
                            ? Colors.white
                            : controller.availShowtime(data.schedule[index])
                                ? Colors.black
                                : AppColor.backgroundColor2,
                      ),
                    ),
                  ),
                ),
              );
            });
          },
        ),
      );
    });
  }
}
