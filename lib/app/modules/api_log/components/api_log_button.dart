import 'package:flutix/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ApiLogButton extends StatelessWidget {
  const ApiLogButton({Key? key, required this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 48.w,
      child: GestureDetector(
        onTap: () => Get.toNamed(Routes.API_LOG),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32.w),
            color: color,
          ),
          child: const Icon(Icons.bug_report),
        ),
      ),
    );
  }
}
