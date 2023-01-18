import 'package:flutix/app/modules/home/components/movie_playing_item.dart';
import 'package:flutix/app/modules/home/controllers/movie_controller.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/others/shimmer_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MoviePlaying extends GetView<MovieController> {
  const MoviePlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.xl),
            child: Text('Now Playing', style: TextStyles.title),
          ),
          SizedBox(
            width: double.infinity,
            height: 150.w,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.isLoadingMoviePlaying.value
                  ? 10
                  : controller.listMoviePlaying.length,
              itemBuilder: (context, index) {
                if (controller.isLoadingMoviePlaying.value) {
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 20.w : 16.w,
                      right: index == controller.listMoviePlaying.length - 1
                          ? 20
                          : 0,
                      top: 16.w,
                      bottom: 16.w,
                    ),
                    child: ShimmerIndicator(
                      width: 200.w,
                      height: 150.w,
                      borderRadius: Insets.med,
                    ),
                  );
                } else {
                  return MoviePlayingItem(
                    data: controller.listMoviePlaying[index],
                    margin: EdgeInsets.only(
                      left: index == 0 ? 20.w : 16.w,
                      right: index == controller.listMoviePlaying.length - 1
                          ? 20
                          : 0,
                      top: 16.w,
                      bottom: 16.w,
                    ),
                    onTap: () {},
                  );
                }
              },
            ),
          ),
        ],
      );
    });
  }
}
