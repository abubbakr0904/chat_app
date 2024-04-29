class MessageModel {
  String text;
  String time;
  String email;

  MessageModel({required this.text,
    required this.time,
    required this.email,

  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      text: json["text"] ?? "",
      time: json["time"] ?? "",
      email: json["email"] ?? "",

    );
  }

  toJson(){
    return {
      "text" : text,
      "time" : time,
      "email" : email
    };
  }
}
