import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CardApp(
        margin: EdgeInsets.symmetric(horizontal: Insets.xl, vertical: 10.w),
        isShowShadows: true,
        shadows: Shadows.shadowsUp,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.w),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.primaryColor1,
              ),
              child: Icon(icon, color: AppColor.yellowColor1, size: 14.w),
            ),
            horizontalSpace(Insets.sm),
            Expanded(child: Text(label, style: TextStyles.text)),
            Icon(Icons.arrow_forward_ios, size: 14.w),
          ],
        ),
      ),
    );
  }
}
