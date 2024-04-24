import 'dart:developer';

import 'package:pusher_channels_flutter/pusher_channels_flutter.dart';

class PusherConfig {
  static const appId = '1690644';
  static const key = 'd63019e6b060a9d3d52d';
  static const cluster = 'eu';
  static const secret = '600fa97fa1444c07e804';
  static const channelName = 'my-channel';

  PusherChannelsFlutter pusher = PusherChannelsFlutter.getInstance();

  static void sendRemoteUserId(int remoteUserId) {
    log('Sending remote user ID: $remoteUserId');
  }

  void onConnectionStateChange(dynamic currentState, dynamic previousState) {
    log("Connection: $currentState");
  }

  void onError(String message, int? code, dynamic e) {
    log("onError: $message code: $code exception: $e");
  }

  void onEvent(PusherEvent event) {
    log("onEvent: $event");
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
}
