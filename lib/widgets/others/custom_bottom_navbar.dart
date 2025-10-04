import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });
  final int selectedIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 55.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ItemNavbar(
            isSelected: selectedIndex == 0,
            label: 'movie'.tr,
            assetIcon: selectedIndex == 0
                ? AppAsset.icon('ic_movie_selected.png')
                : AppAsset.icon('ic_movie_unselect.png'),
            onTap: () => onTap(0),
          ),
          SizedBox(width: Get.width / 5),
          ItemNavbar(
            isSelected: selectedIndex == 1,
            label: 'ticket'.tr,
            assetIcon: selectedIndex == 1
                ? AppAsset.icon('ic_ticket_selected.png')
                : AppAsset.icon('ic_ticket_unselect.png'),
            onTap: () => onTap(1),
          ),
        ],
      ),
    );
  }
}

class ItemNavbar extends StatelessWidget {
  const ItemNavbar({
    super.key,
    required this.isSelected,
    required this.label,
    this.assetIcon = '',
    this.onTap,
    this.icon,
  });

  final bool isSelected;
  final String label;
  final String assetIcon;
  final Function()? onTap;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: Get.width / 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isSelected ? 22.w : 20.w,
              height: isSelected ? 22.w : 20.w,
              child: assetIcon.isNotEmpty
                  ? Image.asset(assetIcon)
                  : Icon(
                      icon,
                      color: isSelected ? AppColor.primaryColor1 : Colors.grey,
                      size: isSelected ? 16.w : 15.w,
                    ),
            ),
            verticalSpace(Insets.xs),
            Text(
              label,
              style: TextStyles.text.copyWith(
                fontSize: 10.w,
                color: isSelected ? AppColor.primaryColor1 : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
