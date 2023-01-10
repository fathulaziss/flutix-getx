import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';

class InputDropdownItem extends StatelessWidget {
  const InputDropdownItem({
    Key? key,
    required this.value,
  }) : super(key: key);

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
