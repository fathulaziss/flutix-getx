import 'package:flutix/app/models/movie_model.dart';
import 'package:flutix/app/modules/browse_movie/controllers/browse_movie_controller.dart';
import 'package:flutix/app_config.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
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
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardApp(
            padding: EdgeInsets.zero,
            color: AppColor.backgroundColor2,
            width: 70.w,
            height: 100.w,
            radius: Insets.med,
            child: data.posterPath.isNotEmpty
                ? ClipRRect(
                    borderRadius: BorderRadius.all(Corners.medRadius),
                    child: Image.network(
                      '${AppConfig.imageBaseUrl}w1280${data.posterPath}',
                      fit: BoxFit.cover,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.all(Insets.med),
                    child: Image.asset(AppAsset.image('logo_app.png')),
                  ),
          ),
          Padding(
            padding: EdgeInsets.all(Insets.sm),
            child: Column(
              children: [
                Text(
                  data.title,
                  style: TextStyles.title.copyWith(fontSize: 14.w),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
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
          )
        ],
      ),
    );
  }
}
