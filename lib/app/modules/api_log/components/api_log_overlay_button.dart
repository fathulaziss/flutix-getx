import 'package:flutix/app/modules/api_log/components/api_log_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ApiLogOverlayButton extends StatefulWidget {
  const ApiLogOverlayButton({super.key});

  @override
  OverlayLogButtonState createState() => OverlayLogButtonState();
}

class OverlayLogButtonState extends State<ApiLogOverlayButton> {
  double y = 100;

  @override
  Widget build(BuildContext context) {
    return Overlay(
      initialEntries: [
        OverlayEntry(
          builder: (context) => Positioned(
            right: 0,
            top: y,
            child: SizedBox(
              height: 48.w,
              width: 48.w,
              child: Draggable(
                feedback: const ApiLogButton(color: Colors.red),
                childWhenDragging: Container(),
                onDragEnd: (dragDetails) {
                  setState(() {
                    y = dragDetails.offset.dy - 20;
                  });
                },
                child: const ApiLogButton(color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
