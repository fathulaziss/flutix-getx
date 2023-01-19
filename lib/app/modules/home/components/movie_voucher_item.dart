import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieVoucherItem extends StatelessWidget {
  const MovieVoucherItem({
    super.key,
    required this.desc,
    required this.discount,
    required this.title,
    required this.onTap,
  });

  final String title;
  final String desc;
  final int discount;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardApp(
        width: double.infinity,
        height: 80.w,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.only(
          bottom: Insets.lg,
          left: Insets.xl,
          right: Insets.xl,
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: Corners.medBorder,
              child: Image.asset(
                AppAsset.image('img_background_voucher.png'),
                width: double.infinity,
                height: 80.w,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Insets.xl),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyles.text
                              .copyWith(color: AppColor.disabledColor2),
                        ),
                        Text(
                          desc,
                          style: TextStyles.desc
                              .copyWith(color: AppColor.primaryColor3),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'OFF ',
                          style: TextStyles.text.copyWith(
                            color: AppColor.yellowColor1,
                            fontWeight: FontWeight.normal,
                            fontSize: 18.w,
                          ),
                        ),
                        Text(
                          '$discount%',
                          style: TextStyles.title.copyWith(
                            color: AppColor.yellowColor1,
                            fontSize: 18.w,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}