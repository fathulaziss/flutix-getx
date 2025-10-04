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
        padding: EdgeInsets.zero,
        margin: EdgeInsets.only(
          bottom: Insets.med,
          left: Insets.xl,
          right: Insets.xl,
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
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
              padding: EdgeInsets.symmetric(horizontal: Insets.lg),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.text
                              .copyWith(color: AppColor.disabledColor2),
                        ),
                        Text(
                          desc,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.desc
                              .copyWith(color: AppColor.primaryColor3),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
