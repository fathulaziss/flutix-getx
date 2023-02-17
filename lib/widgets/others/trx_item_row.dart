import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';

class TrxItemRow extends StatelessWidget {
  const TrxItemRow({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Insets.xs),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyles.text.copyWith(color: AppColor.disabledColor2),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyles.desc.copyWith(fontWeight: FontWeight.bold),
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
