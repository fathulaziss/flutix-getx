import 'package:flutix/app/modules/home/components/movie_voucher_item.dart';
import 'package:flutix/app/modules/home/controllers/movie_controller.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/others/shimmer_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MovieVoucher extends GetView<MovieController> {
  const MovieVoucher({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Insets.xl,
              vertical: Insets.sm,
            ),
            child: Text(
              'voucher'.tr,
              style: TextStyles.text.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          if (controller.isLoadingMovieVoucher.value)
            ...List.generate(
              3,
              (index) => Padding(
                padding: EdgeInsets.only(
                  bottom: Insets.med,
                  left: Insets.xl,
                  right: Insets.xl,
                ),
                child: ShimmerIndicator(
                  width: double.infinity,
                  height: 80.w,
                  borderRadius: Insets.med,
                ),
              ),
            )
          else
            ...List.generate(
              controller.listMovieVoucher.length,
              (index) => MovieVoucherItem(
                desc: controller.listMovieVoucher[index].desc,
                discount: controller.listMovieVoucher[index].discount,
                title: controller.listMovieVoucher[index].title,
                onTap: () {},
              ),
            ),
        ],
      );
    });
  }
}
