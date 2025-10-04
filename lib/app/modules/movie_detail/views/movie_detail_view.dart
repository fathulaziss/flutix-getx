import 'package:flutix/app/modules/movie_detail/components/movie_detail_body.dart';
import 'package:flutix/app/modules/movie_detail/components/movie_detail_poster.dart';
import 'package:flutix/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageDefault(
        title: 'movieDetail'.tr,
        backgroundColor: AppColor.backgroundColor1,
        bottomBarHeight: controller.isShowButton.value ? 70.w : 0,
        bottomBar: controller.isShowButton.value
            ? Container(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                decoration: BoxDecoration(
                  boxShadow: Shadows.shadowsUp,
                  color: AppColor.backgroundColor1,
                ),
                child: ButtonPrimary(
                  onTap: () => Get.toNamed(
                    Routes.ORDER,
                    arguments: {
                      'movie_data': controller.movieData.value,
                      'movie_detail_data': controller.movieDetailData.value,
                    },
                  ),
                  label: 'letsWatch'.tr,
                  margin: EdgeInsets.symmetric(horizontal: 24.w),
                ),
              )
            : const SizedBox(),
        child: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              elevation: 0,
              expandedHeight: 270.w,
              toolbarHeight: 180.w,
              pinned: true,
              floating: true,
              automaticallyImplyLeading: false,
              flexibleSpace: const MovieDetailPoster(),
            ),
            const SliverToBoxAdapter(child: MovieDetailBody()),
          ],
        ),
      );
    });
  }
}
