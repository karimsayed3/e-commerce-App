class UserData {
  bool? status;
  String? message;
  Data? data;

  UserData({
    this.status,
    this.message,
    this.data,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;

  String? name;

  String? email;

  String? phone;

  String? image;

  String? token;

  Data({
    this.name,
    this.id,
    this.email,
    this.phone,
    this.image,
    this.token,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }
}
