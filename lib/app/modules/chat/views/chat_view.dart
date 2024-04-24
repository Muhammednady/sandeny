import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sandeny/app/modules/chat/controllers/chat_controller.dart';
import 'package:sandeny/constants/colors_manager.dart';

import '../../../../constants/images_manager.dart';

class ChatView extends GetView<ChatController> {
  const ChatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    int doctorId = Get.arguments;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('chat_consultation'.tr),
          backgroundColor: ColorsManager.mainColor,
          centerTitle: true,
          // show the back button
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
        body: RefreshIndicator(
          onRefresh: () async {
            await controller.getChatMessages(doctorId: doctorId);
          },
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.mainColor,
                ),
              );
            } else {
              if (controller.chatMessages.isEmpty) {
                return Center(
                  child: Text(
                    'no_messages_yet'.tr,
                  ),
                );
              } else {
                return Stack(
                  children: [
                    DashChat(
                      currentUser: controller.user,
                      onSend: (ChatMessage message) {
                        controller.sendMessage(
                            doctorId: doctorId, message: message.text);
                        controller.handleSentMessage(message.text);
                      },
                      messages: controller.chatMessages,
                      messageOptions: const MessageOptions(
                        containerColor: ColorsManager.primaryColor,
                        textColor: Colors.white,
                        currentUserContainerColor: ColorsManager.mainColor,
                        currentUserTextColor: Colors.white,
                      ),
                      inputOptions: InputOptions(
                        sendButtonBuilder: (send) {
                          return IconButton(
                            onPressed: send,
                            icon: const Icon(
                              Icons.send,
                              color: ColorsManager.mainColor,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }
            }
          }),
        ),
      ),
    );
  }
}
