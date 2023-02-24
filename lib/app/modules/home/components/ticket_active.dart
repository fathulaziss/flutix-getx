import 'package:flutix/app/modules/home/controllers/ticket_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutix/widgets/others/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketActive extends GetView<TicketController> {
  const TicketActive({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isLoading.value
          ? LoadingIndicatorBounce(size: 25.w)
          : controller.listTicketActive.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.only(top: 10.w),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.listTicketActive.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom:
                              index == controller.listTicketActive.length - 1
                                  ? 70.w
                                  : 0,
                        ),
                        child: CardApp(
                          color: AppColor.primaryColor1,
                          child: Text(
                            controller.listTicketActive[index].cinema,
                            style:
                                TextStyles.title.copyWith(color: Colors.white),
                          ),
                        ),
                        // child: TicketItem(
                        //   data: controller.listTicketActive[index],
                        //   onTap: () => Get.toNamed(
                        //     Routes.TICKET_DETAIL,
                        //     arguments: {
                        //       'data': controller.listTicketActive[index]
                        //     },
                        //   ),
                        // ),
                      );
                    },
                  ),
                )
              // : TicketEmpty(desc: 'dontHaveTicket'.tr);
              : const Center(child: Text('Data Tidak Ada'));
    });
  }
}
