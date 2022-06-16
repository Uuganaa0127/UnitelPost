class User {
  final int? userId;
  final String? name;
  final String? email;
  final String? phone;
  final String? type;
  final String? token;
  final String? renewalToken;
  User(
      {this.email,
      this.name,
      this.phone,
      this.renewalToken,
      this.token,
      this.type,
      this.userId});
  factory User.fromJson(Map<String, dynamic> responseData) {
    return User(
        email: responseData['Email'],
        phone: responseData['phone'],
        name: responseData['name'],
        userId: responseData['userId'],
        token: responseData['token'],
        type: responseData['type'],
        renewalToken: responseData['renewalToken']);
  }
}
