import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class RegistrationModel {
  String? name;
  String? phone;
  String? email;
  String? password;

  RegistrationModel({
    this.name,
    this.phone,
    this.email,
    this.password,
  });

  RegistrationModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    return data;
  }


}
