import 'package:flutix/app/modules/movie_detail/components/movie_detail_cast_item.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MovieDetailCast extends StatelessWidget {
  const MovieDetailCast({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(Insets.lg),
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Text('cast'.tr, style: TextStyles.text),
        ),
        verticalSpace(Insets.xs),
        SizedBox(
          width: Get.width,
          height: 121.w,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieDetailCastItem(
                margin: EdgeInsets.only(
                  left: index == 0 ? 20.w : 16.w,
                  right: index == 3 ? 20.w : 0,
                ),
              );
            },
          ),
        ),
        verticalSpace(Insets.lg),
      ],
    );
  }
}
