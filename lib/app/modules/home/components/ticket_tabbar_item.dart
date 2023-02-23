import 'package:flutix/styles/colors.dart';
import 'package:flutter/material.dart';

class TicketTabBarItem extends StatelessWidget {
  const TicketTabBarItem({Key? key, required this.label}) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: AppColor.primaryColor1,
        alignment: Alignment.center,
        child: Text(label),
      ),
    );
  }
}
