import 'package:flutix/app/modules/home/components/movie_browse.dart';
import 'package:flutix/app/modules/home/components/movie_coming_soon.dart';
import 'package:flutix/app/modules/home/components/movie_header.dart';
import 'package:flutix/app/modules/home/components/movie_showing.dart';
import 'package:flutix/app/modules/home/components/movie_top_rated.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabMovie extends StatelessWidget {
  const TabMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        const MovieHeader(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const MovieShowing(),
                const MovieBrowse(),
                const MovieComingSoon(),
                const MovieTopRated(),
                // const MovieVoucher(),
                verticalSpace(100.w),
              ],
            ),
          ),
        )
      ],
    );
  }
}
