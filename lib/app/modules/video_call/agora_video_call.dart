
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandeny/constants/agora_constant.dart';
import 'package:sandeny/constants/colors_manager.dart';
import 'package:agora_uikit/agora_uikit.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AgoraClient client = AgoraClient(
    agoraConnectionData: AgoraConnectionData(
      // rtmUid: ,
      appId: AgoraService.appId,
      channelName: AgoraService.channelName,
      // username: "omeramasib",
      // tokenUrl: AgoraService.token
      tempToken: AgoraService.token,
    ),
  );

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  void initAgora() async {
    await client.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('video_consultation'.tr),
          backgroundColor: ColorsManager.mainColor,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              AgoraVideoViewer(
                client: client,
                layoutType: Layout.floating,
                enableHostControls: true, // Add this to enable host controls
              ),
              AgoraVideoButtons(
                client: client,
                addScreenSharing: false, // Add this to enable screen sharing
                onDisconnect: () {
                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int? _remoteUid;
//   bool _localUserJoined = false;
//   late RtcEngine _engine;

//   @override
//   void initState() {
//     super.initState();
//     initAgora();
//   }

//   Future<void> initAgora() async {
//     // retrieve permissions
//     await [Permission.microphone, Permission.camera].request();

//     //create the engine
//     _engine = createAgoraRtcEngine();
//     await _engine.initialize(const RtcEngineContext(
//       appId: AgoraService.appId,
//       channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//     ));

//     _engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//           debugPrint("local user ${connection.localUid} joined");
//           setState(() {
//             _localUserJoined = true;
//           });
//         },
//         onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//           debugPrint("remote user $remoteUid joined");
//           setState(() {
//             _remoteUid = remoteUid;
//           });
//         },
//         onUserOffline: (RtcConnection connection, int remoteUid,
//             UserOfflineReasonType reason) {
//           debugPrint("remote user $remoteUid left channel");
//           setState(() {
//             _remoteUid = null;
//           });
//         },
//         onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
//           debugPrint(
//               '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
//         },
//       ),
//     );

//     await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//     await _engine.enableVideo();
//     await _engine.startPreview();

//     await _engine.joinChannel(
//       token: AgoraService.token,
//       channelId: AgoraService.channelName,
//       uid: 0,
//       options: const ChannelMediaOptions(),
//     );
//   }

//   // Create UI with local view and remote view
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('video_consultation'.tr),
//       ),
//       body: Stack(
//         children: [
//           Center(
//             child: _remoteVideo(),
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: SizedBox(
//               width: 100,
//               height: 150,
//               child: Center(
//                 child: _localUserJoined
//                     ? AgoraVideoView(
//                         controller: VideoViewController(
//                           rtcEngine: _engine,
//                           canvas: const VideoCanvas(uid: 0),
//                         ),
//                       )
//                     : const CircularProgressIndicator(
//                         color: ColorsManager.mainColor,
//                       ),
//               ),
//             ),
//           ),

//           // create button to cancel the video call
//           Positioned(
//             top: Get.height / 1.3,
//             left: Get.width / 3,
//             child: ElevatedButton(
//               onPressed: () async {
//                 await _engine.leaveChannel();
//                 Get.back();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: ColorsManager.errorColor,
//               ),
//               child: Text('end_consultation'.tr),
//             ),
//           ),

//           // create button to switch camera
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: () async {
//                   await _engine.switchCamera();
//                 },
//                 child: Text('switch_camera'.tr),
//               ),
//             ),
//           ),

//           // create button to mute audio
//           Align(
//             alignment: Alignment.bottomLeft,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: () async {
//                   await _engine.muteLocalAudioStream(!_localUserJoined);
//                   log('_localUserJoined: $_localUserJoined');
//                   setState(() {
//                     _localUserJoined = !_localUserJoined;
//                   });
//                 },
//                 child: Text('mute_audio'.tr),
//               ),
//             ),
//           ),

//           // create button to mute video
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: ElevatedButton(
//                 onPressed: () async {
//                   await _engine.muteLocalVideoStream(!_localUserJoined);
//                   setState(() {
//                     _localUserJoined = !_localUserJoined;
//                   });
//                 },
//                 child: Text('mute_video'.tr),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Display remote user's video
//   Widget _remoteVideo() {
//     if (_remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: _remoteUid),
//           connection: const RtcConnection(channelId: AgoraService.channelName),
//         ),
//       );
//     } else {
//       return Text(
//         'wait_for_doctor'.tr,
//         textAlign: TextAlign.center,
//       );
//     }
//   }
// }
