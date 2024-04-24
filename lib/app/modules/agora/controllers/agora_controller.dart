import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sandeny/constants/agora_constant.dart';

class AgoraController extends GetxController {
  RxInt remoteUid = 0.obs;
  RxBool localUserJoined = false.obs;
  late RtcEngine engine;

  void changeLocalUserJoined(bool value) {
    localUserJoined.value = value;
    update();
  }

  Future<void> initAgora() async {
    // Retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    // Create the engine
    final engine = createAgoraRtcEngine();
    await engine.initialize(RtcEngineContext(
      appId: AgoraService.appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));

    engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          changeLocalUserJoined(true);
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          changeRemoteUid(remoteUid);
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          changeRemoteUid(0);
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
      ),
    );

    await engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await engine.enableVideo();
    await engine.startPreview();

    await engine.joinChannel(
      token: AgoraService.token,
      channelId: AgoraService.channelName,
      uid: 0,
      options: const ChannelMediaOptions(),
    );
  }

  @override
  void onInit() {
    super.onInit();
    initAgora();
  }

  void changeRemoteUid(int value) {
    remoteUid.value = value;
    update();
  }

}
