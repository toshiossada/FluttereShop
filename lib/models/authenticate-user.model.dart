class AuthenticateUserModel {
  String username;
  String password;

  AuthenticateUserModel({
    this.username,
    this.password,
  });

  AuthenticateUserModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    return data;
  }
}
