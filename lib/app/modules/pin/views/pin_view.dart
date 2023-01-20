import 'package:flutix/app/modules/pin/components/pin_numpad.dart';
import 'package:flutix/app/modules/pin/components/pin_preview.dart';
import 'package:flutix/app/modules/pin/controllers/pin_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinView extends GetView<PinController> {
  const PinView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageDefault(
      title: 'pinVerification'.tr,
      backgroundColor: AppColor.backgroundColor1,
      child: Obx(() {
        return Flex(
          direction: Axis.vertical,
          children: [
            PinPreview(pin: controller.pin.value),
            const PinNumpad(),
          ],
        );
      }),
    );
  }
}
