import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonIconVertical extends StatelessWidget {
  const ButtonIconVertical({
    super.key,
    required this.icon,
    required this.name,
    required this.onTap,
  });

  final String icon;
  final String name;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 60.w,
        child: Column(
          children: [
            CardApp(
              width: 55.w,
              height: 55.w,
              padding: EdgeInsets.all(Insets.sm),
              color: AppColor.backgroundColor2,
              child: Image.asset(icon),
            ),
            verticalSpace(Insets.xs),
            Text(name, style: TextStyles.desc),
          ],
        ),
      ),
    );
  }
}
