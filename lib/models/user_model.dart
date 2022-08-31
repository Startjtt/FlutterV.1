class UserModel {
  UserModel({
      this.message, 
      this.status, 
      this.token, 
      this.data,});

  UserModel.fromJson(dynamic json) {
    message = json['message'];
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  num? status;
  String? token;
  Data? data;
UserModel copyWith({  String? message,
  num? status,
  String? token,
  Data? data,
}) => UserModel(  message: message ?? this.message,
  status: status ?? this.status,
  token: token ?? this.token,
  data: data ?? this.data,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['status'] = status;
    map['token'] = token;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.firstName, 
      this.lastName, 
      this.depName,});

  Data.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    depName = json['depName'];
  }
  String? firstName;
  String? lastName;
  String? depName;
Data copyWith({  String? firstName,
  String? lastName,
  String? depName,
}) => Data(  firstName: firstName ?? this.firstName,
  lastName: lastName ?? this.lastName,
  depName: depName ?? this.depName,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['depName'] = depName;
    return map;
  }

}