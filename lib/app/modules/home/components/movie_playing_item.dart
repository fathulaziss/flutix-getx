import 'package:flutix/app/models/movie_model.dart';
import 'package:flutix/app_config.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutix/widgets/others/rating_star.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoviePlayingItem extends StatelessWidget {
  const MoviePlayingItem({
    super.key,
    required this.data,
    required this.margin,
    required this.onTap,
  });

  final MovieModel data;
  final EdgeInsets margin;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardApp(
        width: 200.w,
        margin: margin,
        padding: EdgeInsets.zero,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Corners.med),
          child: Stack(
            children: [
              Image.network(
                '${AppConfig.imageBaseUrl}w780${data.backdropPath}',
                fit: BoxFit.cover,
                width: 200.w,
                height: 150.w,
              ),
              Container(
                width: 200.w,
                padding: EdgeInsets.all(Insets.med),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Corners.med),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.61),
                      Colors.black.withOpacity(0)
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
                    RatingStar(voteAverage: data.voteAverage)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
