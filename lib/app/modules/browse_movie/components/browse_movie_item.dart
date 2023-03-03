import 'package:flutix/app/models/movie_model.dart';
import 'package:flutix/app/modules/browse_movie/controllers/browse_movie_controller.dart';
import 'package:flutix/app_config.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutix/widgets/others/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BrowseMovieItem extends GetView<BrowseMovieController> {
  const BrowseMovieItem({super.key, required this.data, required this.onTap});

  final MovieModel data;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: onTap,
        child: CardApp(
          isShowShadows: true,
          padding: EdgeInsets.zero,
          margin: EdgeInsets.fromLTRB(
            Insets.xl,
            0,
            Insets.xl,
            Insets.xl,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Corners.smRadius,
                  topRight: Corners.smRadius,
                ),
                child: Image.network(
                  '${AppConfig.imageBaseUrl}w1280${data.backdropPath}',
                  width: Get.width,
                  height: 150.w,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(Insets.sm),
                child: Column(
                  children: [
                    Text(
                      data.title,
                      style: TextStyles.title.copyWith(fontSize: 14.w),
                    ),
                    RatingStar(
                      voteAverage: data.voteAverage,
                      textColor: Colors.black,
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    Text(
                      controller.cMovie.listMovieShowing.contains(data)
                          ? 'nowShowing'.tr
                          : 'comingSoon'.tr,
                      style: TextStyles.text,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
