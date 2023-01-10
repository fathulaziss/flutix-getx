import 'package:flutix/styles/styles.dart';
import 'package:flutter/material.dart';

class BlockedView extends StatelessWidget {
  const BlockedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'This App Blocked For You Because Your Device has been Rooted',
          style: TextStyles.title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
