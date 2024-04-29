class UserModel {
  String name;
  String email;
  String phonenumber;

  UserModel({required this.name,
    required this.email,
  required this.phonenumber});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"] ?? "",
      email: json["email"] ?? "",
      phonenumber: json["phonenumber"] ?? "",

    );
  }

  toJson(){
    return {
      "name" : name,
      "email" : email,
      "phonenumber" : phonenumber
    };
  }
}
