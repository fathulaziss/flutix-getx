import 'package:flutix/app/modules/home/components/movie_item.dart';
import 'package:flutix/app/modules/home/controllers/movie_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/others/shimmer_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MovieComingSoon extends GetView<MovieController> {
  const MovieComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          verticalSpace(Insets.sm),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.xl),
            child: Text(
              'comingSoon'.tr,
              style: TextStyles.text.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          if (controller.isLoadingMovieComingSoon.value)
            SizedBox(
              width: double.infinity,
              height: 164.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 20.w : 16.w,
                      right: index == 10 ? 20 : 0,
                      top: 8.w,
                      bottom: 8.w,
                    ),
                    child: ShimmerIndicator(
                      width: 100.w,
                      height: 164.w,
                      borderRadius: Insets.med,
                    ),
                  );
                },
              ),
            )
          else
            SizedBox(
              width: double.infinity,
              height: 164.w,
              child: controller.listMovieComingSoon.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listMovieComingSoon.length,
                      itemBuilder: (context, index) {
                        return MovieItem(
                          data: controller.listMovieComingSoon[index],
                          isShowTitleAndRating: false,
                          width: 100.w,
                          height: 164.w,
                          margin: EdgeInsets.only(
                            left: index == 0 ? 20.w : 16.w,
                            right: index ==
                                    controller.listMovieComingSoon.length - 1
                                ? 20
                                : 0,
                            top: 8.w,
                            bottom: 8.w,
                          ),
                          onTap: () => Get.toNamed(
                            Routes.MOVIE_DETAIL,
                            arguments: {
                              'movie': controller.listMovieComingSoon[index],
                            },
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text('dataNotFound'.tr, style: TextStyles.text),
                    ),
            ),
        ],
      );
    });
  }
}
