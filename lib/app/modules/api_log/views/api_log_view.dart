import 'package:flutix/app/modules/api_log/components/api_log_item_body.dart';
import 'package:flutix/app/modules/api_log/components/api_log_item_header.dart';
import 'package:flutix/app/modules/api_log/controllers/api_log_controller.dart';
import 'package:flutix/widgets/others/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiLogView extends GetView<ApiLogController> {
  const ApiLogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Log'),
        centerTitle: true,
        shadowColor: Colors.transparent,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Obx(
            () => controller.isLoading.value
                ? const LoadingIndicator(color: Colors.white)
                : Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ExpansionPanelList(
                          elevation: 0,
                          expandedHeaderPadding: EdgeInsets.zero,
                          children: controller.apiLogs
                              .asMap()
                              .map(
                                (i, e) => MapEntry(
                                  i,
                                  ExpansionPanel(
                                    canTapOnHeader: true,
                                    headerBuilder: (context, isExpanded) {
                                      return ApiLogItemHeader(data: e);
                                    },
                                    body: ApiLogItemBody(data: e),
                                    isExpanded: controller.isOpen[i],
                                  ),
                                ),
                              )
                              .values
                              .toList(),
                          expansionCallback: (i, isOpen) {
                            controller.isOpen[i] = !isOpen;
                          },
                        )
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
