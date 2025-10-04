import 'package:flutix/app/modules/order/controllers/order_confirm_controller.dart';
import 'package:flutix/app_config.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutix/widgets/others/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OrderConfirmHeader extends GetView<OrderConfirmController> {
  const OrderConfirmHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            if (controller.cOrder.movieDetailData.value.backdropPath.isNotEmpty)
              Container(
                width: 70.w,
                height: 100.w,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  borderRadius: Corners.smBorder,
                  image: DecorationImage(
                    image: NetworkImage(
                      '${AppConfig.imageBaseUrl}w1280${controller.cOrder.movieDetailData.value.backdropPath}',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              )
            else
              CardApp(
                width: 70.w,
                height: 100.w,
                child: Image.asset(AppAsset.logo('logo_app.png')),
              ),
            horizontalSpace(Insets.med),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.cOrder.movieDetailData.value.title,
                    style:
                        TextStyles.text.copyWith(fontWeight: FontWeight.bold),
                  ),
                  verticalSpace(Insets.xs),
                  Text(
                    controller.cOrder.movieDetailData.value.genres
                        .map((e) => e.name)
                        .join(', '),
                    style: TextStyles.desc
                        .copyWith(color: AppColor.disabledColor2),
                  ),
                  verticalSpace(Insets.xs),
                  RatingStar(
                    voteAverage: controller.cOrder.movieData.value.voteAverage,
                    textColor: AppColor.disabledColor2,
                  ),
                ],
              ),
            ),
          ],
        ),
        verticalSpace(Insets.sm),
        const Divider(color: AppColor.disabledColor2),
        verticalSpace(Insets.sm),
      ],
    );
  }
}
