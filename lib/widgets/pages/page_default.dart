import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PageDefault extends StatelessWidget {
  const PageDefault({
    Key? key,
    required this.child,
    required this.title,
    this.bottomBarHeight = 0,
    this.bottomBar = const SizedBox(),
    this.backgroundColor = Colors.white,
    this.shadowColor,
    this.isScrollable = false,
  }) : super(key: key);

  final String title;
  final Widget child;
  final double bottomBarHeight;
  final Widget bottomBar;
  final Color backgroundColor;
  final Color? shadowColor;
  final bool isScrollable;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        shadowColor: shadowColor,
        title: SizedBox(
          width: Get.width,
          child: Text(
            title,
            style: TextStyles.title.copyWith(color: Colors.white),
          ),
        ),
        leading: IconButton(
          onPressed: Get.back,
          iconSize: 20.w,
          constraints: BoxConstraints(minWidth: 20.w),
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      bottomNavigationBar:
          SizedBox(width: Get.width, height: bottomBarHeight, child: bottomBar),
      body: isScrollable ? SingleChildScrollView(child: child) : child,
    );
  }
}
