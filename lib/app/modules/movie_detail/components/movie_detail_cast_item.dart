import 'package:flutix/app/models/credit_model.dart';
import 'package:flutix/app_config.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieDetailCastItem extends StatelessWidget {
  const MovieDetailCastItem({
    super.key,
    required this.data,
    required this.margin,
  });

  final EdgeInsets margin;
  final CreditModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: SizedBox(
        width: 70.w,
        child: Column(
          children: [
            if (data.profilePath.isNotEmpty)
              CardApp(
                width: 70.w,
                height: 100.w,
                padding: EdgeInsets.zero,
                child: ClipRRect(
                  borderRadius: Corners.medBorder,
                  child: Image.network(
                    '${AppConfig.imageBaseUrl}w500${data.profilePath}',
                    fit: BoxFit.fill,
                  ),
                ),
              )
            else
              CardApp(
                width: 70.w,
                height: 100.w,
                color: AppColor.backgroundColor2,
                padding: EdgeInsets.all(Insets.sm),
                child: ClipRRect(
                  borderRadius: Corners.medBorder,
                  child: Image.asset(AppAsset.image('img_photo_profile.png')),
                ),
              ),
            verticalSpace(Insets.xs),
            Text(
              data.originalName,
              style: TextStyles.desc.copyWith(color: AppColor.disabledColor2),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
