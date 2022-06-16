import '../domain/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPrefrence {
  Future<bool> saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', user.userId!);
    prefs.setString('Email', user.email!);
    prefs.setString('name', user.name!);
    prefs.setString('phone', user.phone!);
    prefs.setString('type', user.type!);
    prefs.setString('token', user.token!);
    return prefs.commit();
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int? userId = prefs.getInt('userId');
    String? name = prefs.getString('name');
    String? email = prefs.getString('Email');
    String? phone = prefs.getString('phone');
    String? token = prefs.getString('token');
    String? type = prefs.getString('type');
    String? renewalToken = prefs.getString('renewalToken');
    return User(
        email: email,
        name: name,
        phone: phone,
        renewalToken: renewalToken,
        token: token,
        type: type,
        userId: userId);
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userId');
    prefs.remove('name');
    prefs.remove('phone');
    prefs.remove('type');
    prefs.remove('Email');
    prefs.remove('token');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    return token!;
  }
}
