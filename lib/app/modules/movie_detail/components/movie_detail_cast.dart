import 'package:flutix/app/modules/movie_detail/components/movie_detail_cast_item.dart';
import 'package:flutix/app/modules/movie_detail/components/movie_detail_cast_shimmer_item.dart';
import 'package:flutix/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MovieDetailCast extends GetView<MovieDetailController> {
  const MovieDetailCast({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 16.w, bottom: 4.w),
            child: Text('cast'.tr, style: TextStyles.text),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: Insets.lg),
            child: SizedBox(
              width: Get.width,
              height: 121.w,
              child: controller.isLoadingCast.value
                  ? ListView.builder(
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return MovieDetailCastShimmerItem(
                          margin: EdgeInsets.only(
                            left: index == 0 ? 20.w : 16.w,
                            right: index == 8 ? 20.w : 0,
                          ),
                        );
                      },
                    )
                  : controller.listCast.isNotEmpty
                      ? ListView.builder(
                          itemCount: controller.listCast.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return MovieDetailCastItem(
                              data: controller.listCast[index],
                              margin: EdgeInsets.only(
                                left: index == 0 ? 20.w : 16.w,
                                right: index == controller.listCast.length - 1
                                    ? 20.w
                                    : 0,
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text(
                            'dataNotFound'.tr,
                            style: TextStyles.text
                                .copyWith(color: AppColor.disabledColor2),
                          ),
                        ),
            ),
          ),
        ],
      );
    });
  }
}
