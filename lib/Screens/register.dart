import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pos/providers/auth_provider.dart';
import 'package:pos/utility/Validator.dart';
import 'package:pos/utility/Widgets.dart';
import 'package:provider/provider.dart';
import 'package:flash/flash.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  final formKey = GlobalKey<FormState>();
  RegExp regex = new RegExp(r'^[0-9]+$');

  late String _username, _password, _confirmPassword;

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );

    var doRegister = () {
      print('on doRegister');

      final form = formKey.currentState;
      if (form!.validate()) {
        form.save();

        auth.loggedInStatus = Status.Authenticating;
        auth.notifyListeners();

        Future.delayed(loginTime).then((_) {
          Navigator.pushReplacementNamed(context, '/login');
          auth.loggedInStatus = Status.LoggedIn;
          auth.notifyListeners();
        });

        /*// now check confirm password
        if(_password.endsWith(_confirmPassword)){

          auth.register(_username, _password).then((response) {
            if(response['status']){
              User user = response['data'];
              Provider.of<UserProvider>(context,listen: false).setUser(user);
              Navigator.pushReplacementNamed(context, '/login');
            }else{
              Flushbar(
                title: 'Registration fail',
                message: response.toString(),
                duration: Duration(seconds: 10),
              ).show(context);
            }
          });

        }else{
          Flushbar(
            title: 'Mismatch password',
            message: 'Please enter valid confirm password',
            duration: Duration(seconds: 10),
          ).show(context);
        }*/

      } else {
        // FlashBar(
        //   title: 'Invalid form',
        //   message: 'Please complete the form properly',
        //   duration: Duration(seconds: 10),
        //    content: null,
        // ).show(context);
      }
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(40.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Text('Email'),
                TextFormField(
                  autofocus: false,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Та нэвтрэх нэрээ оруулна уу';
                    } else if (!regex.hasMatch(value)) {
                      return 'Та Тоо оруулна уу';
                    }
                    return null;
                  },
                  onSaved: (value) => _username = value!,
                  decoration: buildInputDecoration("Enter Email", Icons.email),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Password'),
                SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Please enter password' : null,
                  onSaved: (value) => _password = value!,
                  decoration:
                      buildInputDecoration("Enter Password", Icons.lock),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text('Confirm Password'),
                TextFormField(
                  autofocus: false,
                  obscureText: true,
                  validator: (value) =>
                      value!.isEmpty ? 'Your password is required' : null,
                  onSaved: (value) => _confirmPassword = value!,
                  decoration: buildInputDecoration(
                      "Enter Confirm Password", Icons.lock),
                ),
                SizedBox(
                  height: 20.0,
                ),
                auth.loggedInStatus == Status.Authenticating
                    ? loading
                    : LongButton('Register', doRegister)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
