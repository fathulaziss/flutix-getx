import 'package:flutix/app/modules/browse_movie/components/browse_movie_item.dart';
import 'package:flutix/app/modules/browse_movie/controllers/browse_movie_controller.dart';
import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/others/loading_indicator.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BrowseMovieView extends GetView<BrowseMovieController> {
  const BrowseMovieView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageDefault(
        title: 'browseMovie'.tr,
        backgroundColor: AppColor.backgroundColor1,
        child: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              child: controller.isLoading.value
                  ? LoadingIndicatorBounce(size: 25.w)
                  : controller.listBrowseMovie.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.symmetric(vertical: Insets.xl),
                          child: GridView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.07,
                              mainAxisSpacing: Insets.med,
                              crossAxisSpacing: Insets.med,
                            ),
                            itemCount: controller.listBrowseMovie.length,
                            itemBuilder: (context, index) {
                              return BrowseMovieItem(
                                data: controller.listBrowseMovie[index],
                                onTap: () => Get.toNamed(
                                  Routes.MOVIE_DETAIL,
                                  arguments: {
                                    'movie': controller.listBrowseMovie[index],
                                  },
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: Text(
                            'browseMovieEmpty'.tr,
                            style: TextStyles.text,
                            textAlign: TextAlign.center,
                          ),
                        ),
            ),
          ],
        ),
      );
    });
  }
}
