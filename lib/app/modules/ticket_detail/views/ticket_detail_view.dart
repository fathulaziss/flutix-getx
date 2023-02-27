import 'package:flutix/app/modules/ticket_detail/components/ticket_detail_information.dart';
import 'package:flutix/app/modules/ticket_detail/components/ticket_detail_poster.dart';
import 'package:flutix/app/modules/ticket_detail/components/ticket_detail_qr.dart';
import 'package:flutix/app/modules/ticket_detail/controllers/ticket_detail_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutix/widgets/others/rating_star.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketDetailView extends GetView<TicketDetailController> {
  const TicketDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageDefault(
        title: 'ticketDetail'.tr,
        backgroundColor: AppColor.backgroundColor1,
        isScrollable: true,
        child: CardApp(
          margin: EdgeInsets.all(Insets.xl),
          padding: EdgeInsets.zero,
          color: Colors.white,
          radius: Insets.med,
          isShowShadows: true,
          child: Column(
            children: [
              TicketDetailPoster(data: controller.data.value),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.xl),
                child: Text(
                  controller.data.value.movie.title,
                  style: TextStyles.title.copyWith(fontSize: 14.w),
                  textAlign: TextAlign.center,
                ),
              ),
              RatingStar(
                voteAverage: controller.data.value.movie.voteAverage,
                textColor: Colors.black,
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              TicketDetailInformation(data: controller.data.value),
              if (controller.isTicketActive.value)
                TicketDetailQr(data: controller.data.value),
            ],
          ),
        ),
      );
    });
  }
}
