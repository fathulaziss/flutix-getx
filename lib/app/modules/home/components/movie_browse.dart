import 'package:flutix/app/modules/home/controllers/movie_controller.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/buttons/button_icon_vertical.dart';
import 'package:flutix/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieBrowse extends GetView<MovieController> {
  const MovieBrowse({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Insets.xl),
            child: Text('Browse Movie', style: TextStyles.title),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Insets.xl,
              vertical: Insets.lg,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...controller.cUserInfo.dataUser.value.favoriteGenres.map((e) {
                  return ButtonIconVertical(
                    icon: AppAsset.browseMovieIcon(e),
                    name: AppAsset.browseMovieName(e),
                    onTap: () {
                      showPopUpInfo(
                        title: 'information'.tr,
                        description: 'underDevelopment'.tr,
                      );
                    },
                  );
                })
              ],
            ),
          ),
        ],
      );
    });
  }
}
