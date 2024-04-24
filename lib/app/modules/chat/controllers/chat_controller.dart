import 'dart:convert';
import 'dart:developer';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';
import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

import '../../../../constants/pusher_config.dart';
import '../models/chat_model.dart';
import '../providers/chat_provider.dart';
import '../providers/delete_chat_provider.dart';

class ChatController extends GetxController {
  final chatProvider = ChatProvider();
  final deleteChat = DeleteChatProvider();

  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  void initPusher() async {
    try {
      await pusher.init(
        apiKey: PusherConfig.key,
        cluster: PusherConfig.cluster,
        onConnectionStateChange: onConnectionStateChange,
        onError: onError,
        onSubscriptionSucceeded: onSubscriptionSucceeded,
        onEvent: onEvent,
        onSubscriptionError: onSubscriptionError,
        onDecryptionFailure: onDecryptionFailure,
        onMemberAdded: onMemberAdded,
        onMemberRemoved: onMemberRemoved,
        onSubscriptionCount: onSubscriptionCount,
      );
      log('pusher initialized successfully');
    } catch (e) {
      log('this is the error: $e');
    }
    // subscribe to channel
    pusher.subscribe(channelName: 'message');
    // Connect to Pusher
    pusher.connect();
  }

  RxString pusherChannelName = ''.obs;

  RxInt remoteUid = 0.obs;
  RxInt localUid = 0.obs;

  dynamic user;

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    log("onEvent: $event");
    final jsonData = jsonDecode(event.data);
    final data = jsonData['data'];
    final userFrom = data['message_from'];
    final userTo = data['message_to'];
    final message = data['message_to_mobile'];
    final localUserFrom = getChatData.last.userFrom!.id.toString();
    final localUserTo = getChatData.last.userTo!.id.toString();

    if (message != null) {
      if (userFrom == localUserFrom && userTo == localUserTo ||
          userFrom == localUserTo && userTo == localUserFrom) {
        _handleRecivedNewMessage(message);
      }
    }
  }

  void onSubscriptionSucceeded(String channelName, dynamic data) {
    log("onSubscriptionSucceeded: $channelName data: $data");
    final me = pusher.getChannel(channelName)?.me;
    log("Me: $me");
  }

  void onSubscriptionError(String message, dynamic e) {
    log("onSubscriptionError: $message Exception: $e");
  }

  void onDecryptionFailure(String event, String reason) {
    log("onDecryptionFailure: $event reason: $reason");
  }

  void onMemberAdded(String channelName, PusherMember member) {
    log("onMemberAdded: $channelName user: $member");
  }

  void onMemberRemoved(String channelName, PusherMember member) {
    log("onMemberRemoved: $channelName user: $member");
  }

  void onSubscriptionCount(String channelName, int subscriptionCount) {
    log("onSubscriptionCount: $channelName subscriptionCount: $subscriptionCount");
  }

  RxBool isLoading = false.obs;

  RxList<ChatData> chatData = <ChatData>[].obs;

  RxList<ChatMessage> chatMessages = <ChatMessage>[].obs;

  set setChatData(List<ChatData> value) {
    chatData.value = value;
    update();
  }

  List<ChatData> get getChatData => chatData;

  // method to get the chat data
  Future<void> getChatMessages({
    required int doctorId,
  }) async {
    isLoading.value = true;
    try {
      var response = await chatProvider.getMessages(
        doctortId: doctorId,
      );
      if (response.code == 1) {
        setChatData = response.data!;
        isLoading.value = false;
        user = ChatUser(
          id: response.data!.last.userTo!.id.toString(),
          firstName: response.data!.last.userTo!.firstName!,
          lastName: response.data!.last.userTo!.lastName!,
          profileImage: response.data!.last.userTo!.personalImage!,
        );
        chatMessagesMethod();
      }
    } catch (e) {
      isLoading.value = false;
      log('error:  ${e.toString()}');
    }
    update();
  }

  // method to send the message
  Future<void> sendMessage({
    required int doctorId,
    required String message,
  }) async {
    try {
      await chatProvider.sendMessage(
        doctortId: doctorId,
        message: message,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  void handleSentMessage(String message) {
    final newChatMessage = ChatMessage(
      text: message,
      user: ChatUser(
        firstName: user.firstName,
        lastName: user.lastName,
        profileImage: user.profileImage,
        id: user.id,
      ),
      createdAt: DateTime.now(),
    );

    // Add the new message to the existing list
    chatMessages.insert(0, newChatMessage);

    // Trigger UI update
    update();
  }

  void chatMessagesMethod() {
    chatMessages.assignAll(chatData
        .map((e) {
          return ChatMessage(
            text: e.text!,
            user: ChatUser(
              firstName: e.userTo!.firstName!,
              lastName: e.userTo!.lastName!,
              profileImage: e.userTo!.personalImage!,
              id: e.userTo!.id.toString(),
            ),
            createdAt: DateTime.parse(e.createdAt!),
          );
        })
        .toList()
        .reversed
        .toList());
  }

  void _handleRecivedNewMessage(String message) {
    final newChatMessage = ChatMessage(
      text: message,
      user: ChatUser(
        firstName: getChatData.last.userFrom!.firstName!,
        lastName: getChatData.last.userFrom!.lastName!,
        profileImage: getChatData.last.userFrom!.personalImage!,
        id: getChatData.last.userFrom!.id.toString(),
      ),
      createdAt: DateTime.now(),
    );

    // Add the new message to the existing list
    chatMessages.insert(0, newChatMessage);
    // Trigger UI update
    update();
  }

  void deleteChatMessages(String userId) {
    try {
      deleteChat.deleteMessages(userId: userId);
      // getChatMessages(doctorId: int.parse(userId));
    } catch (e) {
      log(e.toString());
    }
    update();
  }

  @override
  void onInit() {
    initPusher();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    pusher.disconnect();
  }
}
