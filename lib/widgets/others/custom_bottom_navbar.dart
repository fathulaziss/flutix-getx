import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);
  final int selectedIndex;
  final Function(int index) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Insets.xxl),
          topRight: Radius.circular(Insets.xxl),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 5),
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ItemNavbar(
            isSelected: selectedIndex == 0,
            label: 'Home',
            // assetIcon: AppAsset.icon('ic_home.png'),
            icon: Icons.home,
            onTap: () => onTap(0),
          ),
          ItemNavbar(
            isSelected: selectedIndex == 1,
            label: 'Explore',
            // assetIcon: AppAsset.icon('ic_opac.png'),
            icon: Icons.explore,
            onTap: () => onTap(1),
          ),
          ItemNavbar(
            isSelected: selectedIndex == 2,
            label: 'Dashboard',
            // assetIcon: AppAsset.icon('ic_dashboard.png'),
            icon: Icons.dashboard,
            onTap: () => onTap(2),
          ),
          ItemNavbar(
            isSelected: selectedIndex == 3,
            label: 'History',
            // assetIcon: AppAsset.icon('ic_history.png'),
            icon: Icons.history,
            onTap: () => onTap(3),
          ),
          ItemNavbar(
            isSelected: selectedIndex == 4,
            label: 'Account',
            // assetIcon: AppAsset.icon('ic_account.png'),
            icon: Icons.person,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}

class ItemNavbar extends StatelessWidget {
  const ItemNavbar({
    Key? key,
    required this.isSelected,
    required this.label,
    this.assetIcon = '',
    this.onTap,
    this.icon,
  }) : super(key: key);

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
              width: isSelected ? 16.w : 15.w,
              height: isSelected ? 16.w : 15.w,
              child: assetIcon.isNotEmpty
                  ? Image.asset(
                      assetIcon,
                      color: isSelected ? AppColor.primaryColor : Colors.grey,
                    )
                  : Icon(
                      icon,
                      color: isSelected ? AppColor.primaryColor : Colors.grey,
                      size: isSelected ? 16.w : 15.w,
                    ),
            ),
            verticalSpace(Insets.xs),
            Text(
              label,
              style: TextStyles.text.copyWith(
                fontSize: 10.w,
                color: isSelected ? AppColor.primaryColor : Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
