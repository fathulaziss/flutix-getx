import 'package:flutix/app_config.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MovieDetailPoster extends StatelessWidget {
  const MovieDetailPoster({super.key, required this.backdropPath});

  final String backdropPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 270.w,
      decoration: const BoxDecoration(
        color: AppColor.backgroundColor1,
        border: Border(bottom: BorderSide(color: AppColor.backgroundColor1)),
      ),
      child: Stack(
        children: [
          if (backdropPath.isNotEmpty)
            Container(
              height: 270.w,
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                border: const Border(
                  bottom: BorderSide(color: AppColor.backgroundColor1),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    '${AppConfig.imageBaseUrl}w1280$backdropPath',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            )
          else
            CardApp(
              width: Get.width,
              height: 270.w,
              radius: 0,
              child: Image.asset(AppAsset.logo('logo_app.png')),
            ),
          Container(
            height: 270.w,
            width: double.infinity,
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
  }
}
