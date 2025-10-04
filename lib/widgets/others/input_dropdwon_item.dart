import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';

class InputDropdownItem extends StatelessWidget {
  const InputDropdownItem({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    return Flex(
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: Axis.vertical,
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(value, style: TextStyles.text),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
