import 'dart:developer';

import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/agora/controllers/video_call_controller.dart';
import 'package:sandeny/constants/colors_manager.dart';

class VideoCallView extends GetView<VideoCallController> {
  const VideoCallView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'video_consultation'.tr,
            style: const TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          backgroundColor: ColorsManager.mainColor,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: SafeArea(
          child: Obx(
            () => controller.isVideoCallApproved.value == false
                ? const Center(
                    child: CircularProgressIndicator(
                      color: ColorsManager.mainColor,
                    ),
                  )
                : Column(
                    children: [
                      Obx(() {
                        return Column(
                          children: [
                            if (controller.isGreen.value == true) ...[
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color:
                                      ColorsManager.greenColor.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Text(
                                    '${controller.remainingTime}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsManager.greenColor,
                                    ),
                                  ),
                                ),
                              ),
                            ] else if (controller.isYellow.value == true) ...[
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: ColorsManager.yellowColor
                                      .withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Text(
                                    '${controller.remainingTime}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsManager.yellowColor,
                                    ),
                                  ),
                                ),
                              ),
                            ] else if (controller.isRed.value == true) ...[
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 35,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color:
                                      ColorsManager.redColor.withOpacity(0.2),
                                ),
                                child: Center(
                                  child: Text(
                                    '${controller.remainingTime}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: ColorsManager.redColor,
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          ],
                        );
                      }),
                      Expanded(
                        child: AgoraVideoViewer(
                          client: controller.client,
                          layoutType: Layout.grid,
                          enableHostControls:
                              false, // Add this to enable host controls
                          showAVState: true,
                          showNumberOfUsers: true,
                          floatingLayoutContainerHeight: 200,
                          floatingLayoutContainerWidth: 150,
                          disabledVideoWidget: const Center(
                            child: CircularProgressIndicator(
                              color: ColorsManager.mainColor,
                            ),
                          ),
                        ),
                      ),
                      AgoraVideoButtons(
                        client: controller.client,
                        onDisconnect: () async {
                          await controller.pusher.disconnect();
                          controller.isVideoCallApproved.value = false;
                          Get.back();
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
