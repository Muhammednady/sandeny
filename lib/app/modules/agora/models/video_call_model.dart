class GetVideoCallModel {
  Data? data;
  String? msg;
  int? code;

  GetVideoCallModel({this.data, this.msg, this.code});

  GetVideoCallModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    msg = json['msg'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['msg'] = msg;
    data['code'] = code;
    return data;
  }
}

class Data {
  int? id;
  int? userId;
  String? appId;
  String? token;
  String? appCertificate;
  String? channel;
  String? url;
  String? uid;
  String? event;
  String? createdAt;
  String? updatedAt;
  String? pusherEvent;
  String? appointmentId;

  Data(
      {this.id,
      this.userId,
      this.appId,
      this.token,
      this.appCertificate,
      this.channel,
      this.url,
      this.uid,
      this.event,
      this.createdAt,
      this.updatedAt,
      this.pusherEvent,
      this.appointmentId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    appId = json['app_id'];
    token = json['token'];
    appCertificate = json['appCertificate'];
    channel = json['channel'];
    url = json['url'];
    uid = json['uid'];
    event = json['event'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pusherEvent = json['pusher_event'];
    appointmentId = json['appointment_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['app_id'] = appId;
    data['token'] = token;
    data['appCertificate'] = appCertificate;
    data['channel'] = channel;
    data['url'] = url;
    data['uid'] = uid;
    data['event'] = event;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['pusher_event'] = pusherEvent;
    data['appointment_id'] = appointmentId;
    return data;
  }
}
// class GetVideoCallModel {
//   Data? data;
//   String? msg;
//   int? code;

//   GetVideoCallModel({this.data, this.msg, this.code});

//   GetVideoCallModel.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//     msg = json['msg'];
//     code = json['code'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['msg'] = msg;
//     data['code'] = code;
//     return data;
//   }
// }

// class Data {
//   int? id;
//   int? userId;
//   String? appId;
//   String? token;
//   String? appCertificate;
//   String? channel;
//   String? url;
//   String? uid;
//   String? event;
//   String? createdAt;
//   String? updatedAt;
//   String? pusherEvent;

//   Data(
//       {this.id,
//       this.userId,
//       this.appId,
//       this.token,
//       this.appCertificate,
//       this.channel,
//       this.url,
//       this.uid,
//       this.event,
//       this.createdAt,
//       this.updatedAt,
//       this.pusherEvent});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     userId = json['user_id'];
//     appId = json['app_id'];
//     token = json['token'];
//     appCertificate = json['appCertificate'];
//     channel = json['channel'];
//     url = json['url'];
//     uid = json['uid'];
//     event = json['event'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     pusherEvent = json['pusher_event'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['user_id'] = userId;
//     data['app_id'] = appId;
//     data['token'] = token;
//     data['appCertificate'] = appCertificate;
//     data['channel'] = channel;
//     data['url'] = url;
//     data['uid'] = uid;
//     data['event'] = event;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['pusher_event'] = pusherEvent;
//     return data;
//   }
// }
