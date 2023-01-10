import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/app_utils.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetCustom {
  BottomSheetCustom({
    required this.context,
    required this.child,
    this.header,
    this.contentPadding,
    this.buttonBottomPadding,
    this.buttonBottom,
    this.initialChildSize,
    this.resizeToAvoidBottomInset = false,
  });

  final BuildContext context;
  final Widget child;
  final Widget? header;
  final EdgeInsets? contentPadding;
  final EdgeInsets? buttonBottomPadding;
  final Widget? buttonBottom;
  final double? initialChildSize;
  final bool? resizeToAvoidBottomInset;

  void showData() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return GestureDetector(
          onTap: AppUtils.dismissKeyboard,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.w),
                topRight: Radius.circular(18.w),
              ),
              color: Colors.white,
            ),
            padding: resizeToAvoidBottomInset == false
                ? EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  )
                : EdgeInsets.zero,
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return DraggableScrollableSheet(
                  initialChildSize: initialChildSize ?? 0.90,
                  expand: false,
                  builder: (
                    BuildContext context,
                    ScrollController scrollController,
                  ) {
                    return Flex(
                      direction: Axis.vertical,
                      children: [
                        header ??
                            CardApp(
                              width: 100.w,
                              height: 8.w,
                              margin: EdgeInsets.symmetric(vertical: 20.w),
                              padding: EdgeInsets.zero,
                              constraints: BoxConstraints(minHeight: 8.w),
                              color: const Color(0xFFD9D9D9),
                            ),
                        Expanded(
                          child: Padding(
                            padding: contentPadding ??
                                EdgeInsets.symmetric(horizontal: Insets.xl),
                            child: child,
                          ),
                        ),
                        if (buttonBottom != null)
                          CardApp(
                            radius: 0,
                            padding: buttonBottomPadding ??
                                EdgeInsets.all(Insets.xl),
                            isShowShadows: true,
                            shadows: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              )
                            ],
                            child: buttonBottom,
                          )
                        else
                          const SizedBox(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }
}
