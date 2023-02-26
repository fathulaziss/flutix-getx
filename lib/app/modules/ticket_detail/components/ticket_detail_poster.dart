import 'package:flutix/app/models/ticket_model.dart';
import 'package:flutix/app_config.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketDetailPoster extends StatelessWidget {
  const TicketDetailPoster({super.key, required this.data});

  final TicketModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180.w,
      margin: EdgeInsets.only(bottom: Insets.med),
      decoration: BoxDecoration(
        color: AppColor.backgroundColor2,
        image: data.movie.backdropPath.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(
                  '${AppConfig.imageBaseUrl}w500${data.movie.backdropPath}',
                ),
                fit: BoxFit.fill,
              )
            : DecorationImage(image: AssetImage(AppAsset.logo('logo_app.png'))),
        borderRadius: BorderRadius.only(
          topLeft: Corners.medRadius,
          topRight: Corners.medRadius,
        ),
      ),
    );
  }
}
