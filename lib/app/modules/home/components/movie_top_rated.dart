import 'package:flutix/app/modules/home/components/movie_item.dart';
import 'package:flutix/app/modules/home/controllers/movie_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/others/shimmer_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MovieTopRated extends GetView<MovieController> {
  const MovieTopRated({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: Insets.xl,
              right: Insets.xl,
              top: Insets.sm,
            ),
            child: Text(
              'topMovie'.tr,
              style: TextStyles.text.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          if (controller.isLoadingMovieTopRated.value)
            SizedBox(
              width: double.infinity,
              height: 134.w,
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
              height: 134.w,
              child: controller.listMovieTopRated.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.listMovieTopRated.length,
                      itemBuilder: (context, index) {
                        return MovieItem(
                          data: controller.listMovieTopRated[index],
                          margin: EdgeInsets.only(
                            left: index == 0 ? 20.w : 16.w,
                            right:
                                index == controller.listMovieTopRated.length - 1
                                    ? 20
                                    : 0,
                            top: 8.w,
                            bottom: 8.w,
                          ),
                          onTap: () => Get.toNamed(
                            Routes.MOVIE_DETAIL,
                            arguments: {
                              'movie': controller.listMovieTopRated[index],
                              'is_movie_top_rated': true,
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
