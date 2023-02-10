import 'package:flutix/app/modules/movie_detail/controllers/movie_detail_controller.dart';
import 'package:flutix/app_config.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailPoster extends GetView<MovieDetailController> {
  const MovieDetailPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          color: AppColor.backgroundColor1,
          border: Border(bottom: BorderSide(color: AppColor.backgroundColor1)),
        ),
        child: Stack(
          children: [
            if (controller.movieDetailData.value.backdropPath.isNotEmpty)
              Container(
                width: Get.width,
                height: Get.height,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  border: const Border(
                    bottom: BorderSide(color: AppColor.backgroundColor1),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      '${AppConfig.imageBaseUrl}w1280${controller.movieDetailData.value.backdropPath}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              CardApp(
                width: Get.width,
                height: Get.height,
                radius: 0,
                child: Image.asset(AppAsset.logo('logo_app.png')),
              ),
            Container(
              width: Get.width,
              height: Get.height,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(color: AppColor.backgroundColor1),
                ),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    AppColor.backgroundColor1.withOpacity(0.9),
                    AppColor.backgroundColor1.withOpacity(0.1)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
