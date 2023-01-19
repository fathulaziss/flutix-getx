import 'package:flutix/app/modules/home/components/movie_item.dart';
import 'package:flutix/app/modules/home/controllers/movie_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/others/shimmer_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MovieShowing extends GetView<MovieController> {
  const MovieShowing({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.xl),
            child: Text('currentShowing'.tr, style: TextStyles.title),
          ),
          if (controller.isLoadingMovie.value)
            SizedBox(
              width: double.infinity,
              height: 150.w,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 20.w : 16.w,
                      right: index == 10 ? 20 : 0,
                      top: 16.w,
                      bottom: 16.w,
                    ),
                    child: ShimmerIndicator(
                      width: 200.w,
                      height: 150.w,
                      borderRadius: Insets.med,
                    ),
                  );
                },
              ),
            )
          else
            SizedBox(
              width: double.infinity,
              height: 150.w,
              child: controller.listMovieShowing.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listMovieShowing.length,
                      itemBuilder: (context, index) {
                        return MovieItem(
                          data: controller.listMovieShowing[index],
                          margin: EdgeInsets.only(
                            left: index == 0 ? 20.w : 16.w,
                            right:
                                index == controller.listMovieShowing.length - 1
                                    ? 20
                                    : 0,
                            top: 16.w,
                            bottom: 16.w,
                          ),
                          onTap: () => Get.toNamed(
                            Routes.MOVIE_DETAIL,
                            arguments: {
                              'movie': controller.listMovieShowing[index]
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
