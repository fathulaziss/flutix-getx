import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageInfo extends StatelessWidget {
  const PageInfo({Key? key, required this.pageName}) : super(key: key);

  final String pageName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.all(8.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 14.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.w),
              color: Colors.amberAccent,
            ),
            child: Text(
              pageName.replaceAll('/', ''),
              style: TextStyle(fontSize: 8.w),
            ),
          ),
        ],
      ),
    );
  }
}
