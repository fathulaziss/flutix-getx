import 'package:flutter/material.dart';

class UnderDevelopmentView extends StatelessWidget {
  const UnderDevelopmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('UnderDevelopmentView'), centerTitle: true),
      body: const Center(
        child: Text(
          'This Feature is Under Development',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
