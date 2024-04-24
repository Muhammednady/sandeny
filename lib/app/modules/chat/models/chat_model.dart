class ChatModel {
  List<ChatData>? data;
  String? msg;
  int? code;

  ChatModel({this.data, this.msg, this.code});

  ChatModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ChatData>[];
      json['data'].forEach((v) {
        data!.add(ChatData.fromJson(v));
      });
    }
    msg = json['msg'];
    code = json['code'];
  }
}

class ChatData {
  int? id;
  String? text;
  UserFrom? userFrom;
  UserFrom? userTo;
  String? createdAt;
  int? isRead;

  ChatData(
      {this.id,
      this.text,
      this.userFrom,
      this.userTo,
      this.createdAt,
      this.isRead});

  ChatData.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    text = json['text']?? "" ;
    userFrom = json['user_from'] != null
        ? UserFrom.fromJson(json['user_from'])
        : null;
    userTo =
        json['user_to'] != null ? UserFrom.fromJson(json['user_to']) : null;
    createdAt = json['created_at'] ?? "";
    isRead = json['is_read'] ?? 0;
  }
}

class UserFrom {
  int? id;
  String? firstName;
  String? lastName;
  String? personalImage;

  UserFrom({this.id, this.firstName, this.lastName, this.personalImage});

  UserFrom.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    firstName = json['first_name'] ?? "";
    lastName = json['last_name'] ?? "";
    personalImage = json['personal_image'] ?? "";
  }

}
