import 'package:flutix/styles/styles.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerIndicator extends StatelessWidget {
  const ShimmerIndicator({
    required this.width,
    required this.height,
    this.borderRadius = 0,
    this.shimmerStyle = ShimmerStyle.rectangle,
    super.key,
  });

  final double width;
  final double height;
  final double borderRadius;
  final ShimmerStyle shimmerStyle;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color.fromRGBO(189, 189, 189, 1),
      highlightColor: const Color.fromRGBO(224, 224, 224, 1),
      child: shimmerStyle == ShimmerStyle.rectangle
          ? CardApp(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              radius: borderRadius,
              width: width,
              height: height,
              constraints: BoxConstraints(minHeight: height),
              color: Colors.grey,
            )
          : shimmerStyle == ShimmerStyle.circle
              ? Container(
                  width: width,
                  height: height,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                )
              : const SizedBox(),
    );
  }
}
