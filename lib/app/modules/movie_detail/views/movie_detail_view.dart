import 'package:flutix/app/modules/movie_detail/components/movie_detail_cast.dart';
import 'package:flutix/app/modules/movie_detail/components/movie_detail_poster.dart';
import 'package:flutix/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/others/rating_star.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailView extends GetView<MovieDetailController> {
  const MovieDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageDefault(
        title: 'movieDetail'.tr,
        isScrollable: true,
        backgroundColor: AppColor.backgroundColor1,
        child: Column(
          children: [
            MovieDetailPoster(
              backdropPath: controller.movieDetailData.value.backdropPath,
            ),
            verticalSpace(Insets.lg),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.xl),
              child: Text(
                controller.movieDetailData.value.title,
                style: TextStyles.title.copyWith(fontWeight: FontWeight.normal),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.xl),
              child: Text(
                controller.movieDetailData.value.genres
                    .map((e) => e.name)
                    .join(', '),
                style: TextStyles.desc.copyWith(color: AppColor.disabledColor2),
              ),
            ),
            RatingStar(
              voteAverage: controller.movieDetailData.value.voteAverage,
              mainAxisAlignment: MainAxisAlignment.center,
              textColor: AppColor.disabledColor2,
            ),
            const MovieDetailCast(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.xl),
              child: SizedBox(
                width: Get.width,
                child: Text('storyline'.tr, style: TextStyles.text),
              ),
            ),
            if (controller.movieDetailData.value.overview.isNotEmpty)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Insets.xl),
                child: SizedBox(
                  width: Get.width,
                  child: Text(
                    controller.movieDetailData.value.overview,
                    style: TextStyles.text
                        .copyWith(color: AppColor.disabledColor2),
                  ),
                ),
              )
            else
              Text(
                'dataNotFound'.tr,
                style: TextStyles.text.copyWith(color: AppColor.disabledColor2),
              ),
            verticalSpace(Insets.xl),
          ],
        ),
      );
    });
  }
}
