import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketTabBar extends StatefulWidget {
  const TicketTabBar({
    required this.onTapTabBarMenu,
    required this.listTabBarMenu,
    required this.listTabBarView,
    super.key,
  });

  final Function(int) onTapTabBarMenu;
  final List<Widget> listTabBarMenu;
  final List<Widget> listTabBarView;

  @override
  State<TicketTabBar> createState() => _TicketTabBarState();
}

class _TicketTabBarState extends State<TicketTabBar>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        Container(
          width: double.infinity,
          color: AppColor.primaryColor1,
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
                child: Text(
                  'ticket'.tr,
                  style: TextStyles.title.copyWith(color: Colors.white),
                ),
              ),
              TabBar(
                controller: tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                labelPadding: EdgeInsets.zero,
                labelColor: Colors.white,
                labelStyle: TextStyles.title.copyWith(fontSize: 14.w),
                unselectedLabelStyle: TextStyles.text,
                unselectedLabelColor: AppColor.disabledColor2,
                indicator: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.w, color: Colors.white),
                  ),
                  boxShadow: Shadows.shadowsDown,
                ),
                onTap: (index) => widget.onTapTabBarMenu(index),
                tabs: widget.listTabBarMenu,
              ),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.listTabBarView,
          ),
        ),
      ],
    );
  }
}
