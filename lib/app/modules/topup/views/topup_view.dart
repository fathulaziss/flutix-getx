import 'package:flutix/app/data/topup_data.dart';
import 'package:flutix/app/modules/topup/components/topup_item.dart';
import 'package:flutix/app/modules/topup/controllers/topup_controller.dart';
import 'package:flutix/styles/colors.dart';
import 'package:flutix/styles/styles.dart';
import 'package:flutix/utils/format_currency.dart';
import 'package:flutix/widgets/buttons/button_primary.dart';
import 'package:flutix/widgets/inputs/input_currency.dart';
import 'package:flutix/widgets/pages/page_default.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopupView extends GetView<TopupController> {
  const TopupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PageDefault(
        title: 'topup'.tr,
        backgroundColor: AppColor.backgroundColor1,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Insets.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpace(Insets.xl),
              InputCurrency(
                label: 'Nominal ${'topup'.tr}',
                hint: '0',
                controller: controller.cNominal,
                value: controller.setNominal,
                validation: (value) {
                  final convertValue = int.parse(value.replaceAll('.', ''));
                  if (convertValue >= 10000) {
                    return true;
                  } else {
                    return false;
                  }
                },
                validationText: 'Minimal nominal ${priceFormat(10000)}',
              ),
              verticalSpace(Insets.lg),
              Row(
                children: [
                  const Expanded(
                    child: Divider(color: Colors.black, thickness: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: Insets.sm),
                    child: Text(
                      '${'choose'.tr} Nominal',
                      style: TextStyles.text,
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: Colors.black, thickness: 1),
                  ),
                ],
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 20.w),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 3,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                ),
                itemCount: topUpData.length,
                itemBuilder: (context, index) {
                  return TopUpItem(
                    data: topUpData[index],
                    onTap: () {
                      controller.chooseNominal(topUpData[index]);
                    },
                  );
                },
              ),
              verticalSpace(Insets.lg),
              ButtonPrimary(
                label: 'topup'.tr,
                onTap: controller.submit,
                enabled: controller.isValidNominal.value,
                isLoading: controller.isLoading.value,
              )
            ],
          ),
        ),
      );
    });
  }
}
