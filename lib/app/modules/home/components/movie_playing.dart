import 'package:flutix/app/modules/home/controllers/movie_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MoviePlaying extends GetView<MovieController> {
  const MoviePlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.xl),
          child: Text('Now Playing', style: TextStyles.title),
        ),
        SizedBox(
          width: double.infinity,
          height: 140.w,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.isLoadingMoviePlaying.value ? 5 : 5,
            itemBuilder: (context, index) {
              if (controller.isLoadingMoviePlaying.value) {
                return const SizedBox();
                // return RecommendedDestinationShimmerItem(
                //   margin: EdgeInsets.only(
                //     left: 20.w,
                //     top: 16.w,
                //     bottom: 16.w,
                //   ),
                // );
              } else {
                return CardApp(
                  width: 210.w,
                  margin: EdgeInsets.only(left: 20.w, top: 16.w, bottom: 16.w),
                  color: AppColor.primaryColor1,
                );
                // return RecommendedDestinationItem(
                //   onTap: () => Get.toNamed(
                //     Routes.DESTINATION,
                //     arguments: {
                //       'data': controller.listRecommendedDestination[index]
                //     },
                //   ),
                //   data: controller.listRecommendedDestination[index],
                //   margin: EdgeInsets.only(
                //     left: 20.w,
                //     top: 16.w,
                //     bottom: 16.w,
                //   ),
                // );
              }
            },
          ),
        ),
      ],
    );
  }
}
