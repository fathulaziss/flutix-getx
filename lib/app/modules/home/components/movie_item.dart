import 'package:flutix/app/models/movie_model.dart';
import 'package:flutix/app_config.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutix/widgets/others/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieItem extends StatelessWidget {
  const MovieItem({
    super.key,
    required this.data,
    this.isShowTitleAndRating = true,
    required this.margin,
    required this.onTap,
    this.width,
    this.height,
  });

  final MovieModel data;
  final bool isShowTitleAndRating;
  final EdgeInsets margin;
  final Function() onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardApp(
        width: width ?? 200.w,
        margin: margin,
        padding: EdgeInsets.zero,
        color: AppColor.backgroundColor2,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Corners.med),
          child: Stack(
            children: [
              if (data.backdropPath.isNotEmpty)
                Image.network(
                  '${AppConfig.imageBaseUrl}w500${isShowTitleAndRating ? data.backdropPath : data.posterPath}',
                  fit: BoxFit.cover,
                  width: width ?? 200.w,
                  height: height ?? 150.w,
                )
              else
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(Insets.med),
                    child: Image.asset(AppAsset.logo('logo_app.png')),
                  ),
                ),
              if (isShowTitleAndRating)
                Container(
                  width: width ?? 200.w,
                  padding: EdgeInsets.all(Insets.med),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Corners.med),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.61),
                        Colors.black.withValues(alpha: 0),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.title,
                        style: TextStyles.desc.copyWith(color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      RatingStar(voteAverage: data.voteAverage),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
