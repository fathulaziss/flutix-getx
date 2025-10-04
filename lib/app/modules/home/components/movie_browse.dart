import 'package:flutix/app/modules/home/controllers/movie_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/buttons/button_icon_vertical.dart';
import 'package:flutix/widgets/others/shimmer_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MovieBrowse extends GetView<MovieController> {
  const MovieBrowse({super.key});

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
              'browseMovie'.tr,
              style: TextStyles.text.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Insets.xl,
              vertical: Insets.sm,
            ),
            child: controller.isLoadingMovie.value
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...controller.cUserInfo.dataUser.value.favoriteGenres
                          .map((e) {
                        return ShimmerIndicator(
                          width: 55.w,
                          height: 55.w,
                          borderRadius: Insets.sm,
                        );
                      }),
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...controller.cUserInfo.dataUser.value.favoriteGenres
                          .map((e) {
                        return ButtonIconVertical(
                          icon: AppAsset.browseMovieIcon(e),
                          name: AppAsset.browseMovieName(e),
                          onTap: () => Get.toNamed(
                            Routes.BROWSE_MOVIE,
                            arguments: {'genre_id': e},
                          ),
                          // onTap: () {
                          //   showPopUpInfo(
                          //     title: 'information'.tr,
                          //     description: 'underDevelopment'.tr,
                          //   );
                          // },
                        );
                      }),
                    ],
                  ),
          ),
        ],
      );
    });
  }
}
