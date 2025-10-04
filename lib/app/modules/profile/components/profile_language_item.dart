import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileLanguageItem extends StatelessWidget {
  const ProfileLanguageItem({
    required this.label,
    this.isSelected = false,
    required this.onTap,
    super.key,
  });

  final String label;
  final bool isSelected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Insets.med),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: TextStyles.text,
                ),
                if (isSelected)
                  Icon(
                    Icons.check_circle_outline_rounded,
                    color: AppColor.primaryColor1,
                    size: 18.w,
                  ),
              ],
            ),
            verticalSpace(Insets.xs),
            const Divider(color: AppColor.primaryColor1),
          ],
        ),
      ),
    );
  }
}
