import 'package:flutix/app/modules/pin/components/pin_numpad_button.dart';
import 'package:flutix/app/modules/pin/controllers/pin_controller.dart';
import 'package:flutix/widgets/cards/card_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinNumpad extends GetView<PinController> {
  const PinNumpad({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardApp(
        radius: 0,
        padding: EdgeInsets.zero,
        isShowShadows: true,
        shadows: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 5),
          )
        ],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: PinNumpadButton(
                    text: '1',
                    onPressed: () {
                      controller.setPin('1');
                    },
                  ),
                ),
                Expanded(
                  child: PinNumpadButton(
                    text: '2',
                    onPressed: () {
                      controller.setPin('2');
                    },
                  ),
                ),
                Expanded(
                  child: PinNumpadButton(
                    text: '3',
                    onPressed: () {
                      controller.setPin('3');
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: PinNumpadButton(
                    text: '4',
                    onPressed: () {
                      controller.setPin('4');
                    },
                  ),
                ),
                Expanded(
                  child: PinNumpadButton(
                    text: '5',
                    onPressed: () {
                      controller.setPin('5');
                    },
                  ),
                ),
                Expanded(
                  child: PinNumpadButton(
                    text: '6',
                    onPressed: () {
                      controller.setPin('6');
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: PinNumpadButton(
                    text: '7',
                    onPressed: () {
                      controller.setPin('7');
                    },
                  ),
                ),
                Expanded(
                  child: PinNumpadButton(
                    text: '8',
                    onPressed: () {
                      controller.setPin('8');
                    },
                  ),
                ),
                Expanded(
                  child: PinNumpadButton(
                    text: '9',
                    onPressed: () {
                      controller.setPin('9');
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                const Expanded(
                  child: SizedBox(),
                ),
                Expanded(
                  child: PinNumpadButton(
                    text: '0',
                    onPressed: () {
                      controller.setPin('0');
                    },
                  ),
                ),
                Expanded(
                  child: PinNumpadButton(
                    text: '',
                    onPressed: () {
                      controller.deletePin();
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
