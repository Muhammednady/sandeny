import 'dart:developer';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:sandeny/app/modules/agora/views/video_call_view.dart';
import 'package:sandeny/app/modules/chat/controllers/chat_controller.dart';
import 'package:sandeny/app/modules/connect_with_doctor/controllers/connect_with_doctor_controller.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:sandeny/constants/images_manager.dart';

import '../../../../widgets/Chat_widgets/delete_chat_widget.dart';
import '../../agora/controllers/video_call_controller.dart';

class ConnectWithDoctorView extends GetView<ConnectWithDoctorController> {
  const ConnectWithDoctorView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final chatController = Get.put(ChatController());
    var isArabic = Get.locale!.languageCode == 'ar';
    var argument = Get.arguments;
    log('this is the appointmentEndTime ${argument[5]}');
    log('this is the appointmentEndTime data type: ${argument[5].runtimeType}');
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        title: Text('${argument[3]}'),
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
        actions: [
          Padding(
            padding: isArabic
                ? const EdgeInsets.only(left: 20)
                : const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                final controller = Get.put(VideoCallController());
                final appointmentId = argument[0];
                controller.getVideoCall(appointmentId: appointmentId);
                final appointmentEndMinute = argument[5];
                final appointmentStartMinute = argument[6];
                if (appointmentEndMinute != null) {
                  Get.to(const VideoCallView(),
                      arguments: [
                        appointmentEndMinute,
                        appointmentStartMinute
                      ]);
                }
              },
              child: const Icon(
                CupertinoIcons.videocam_fill,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: GetBuilder(builder: (ChatController chatController) {
        if (chatController.isLoading.value == true) {
          return const Center(
            child: CircularProgressIndicator(
              color: ColorsManager.mainColor,
            ),
          );
        } else {
          if (chatController.chatMessages.isEmpty) {
            return Center(
              child: Text(
                'no_messages_yet'.tr,
              ),
            );
          } else {
            return Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: isArabic
                          ? const EdgeInsets.only(right: 20, top: 20)
                          : const EdgeInsets.only(left: 20, top: 20),
                      child: GestureDetector(
                        onTap: () {
                          deleteChat(context, argument[1].toString());
                        },
                        child: SvgPicture.asset(
                          Images.trash3Icon,
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: DashChat(
                    currentUser: chatController.user,
                    onSend: (ChatMessage message) {
                      chatController.sendMessage(
                          doctorId: argument[1], message: message.text);
                      chatController.handleSentMessage(message.text);
                    },
                    messages: chatController.chatMessages,
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
                ),
              ],
            );
          }
        }
      }),
    );
  }
}
