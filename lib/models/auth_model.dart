class AuthModel {
  String password = '';
  String username = '';
  bool? rememberMe;

  AuthModel({required this.password, required this.username, this.rememberMe});

  AuthModel.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    username = json['username'];
    rememberMe = json['rememberMe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['username'] = this.username;
    data['rememberMe'] = this.rememberMe;
    return data;
  }
}
