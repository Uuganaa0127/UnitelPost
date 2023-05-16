import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:test1/widgets/background.dart';
import 'package:test1/widgets/roundedButton.dart';
import 'package:test1/widgets/roundedInputField.dart';
import 'package:test1/widgets/textFieldContainer.dart';

class loginBody extends StatefulWidget {
  const loginBody({Key? key}) : super(key: key);

  @override
  State<loginBody> createState() => _loginBodyState();
}

class _loginBodyState extends State<loginBody> {
  final myController = TextEditingController();
  TextEditingController emailController = new TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> string = [];
    bool changePass = false;
    log(myController.text);
    print(emailController.text);
    log('pozda:$emailController.text');
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // TextField(
          //   decoration: InputDecoration(
          //       hoverColor: Colors.black,
          //       // icon: Icon(icon),
          //       fillColor: Colors.blue,
          //       border: InputBorder.none),
          //   controller: myController,
          // ),

          // FloatingActionButton(
          //   // When the user presses the button, show an alert dialog containing
          //   // the text that the user has entered into the text field.
          //   onPressed: () {
          //     showDialog(
          //       context: context,
          //       builder: (context) {
          //         return AlertDialog(
          //           // Retrieve the text that the user has entered by using the
          //           // TextEditingController.
          //           content: Text(myController.text),
          //         );
          //       },
          //     );
          //   },
          //   tooltip: 'Show me the value!',
          //   child: const Icon(Icons.text_fields),
          // ),
          // Text(
          //   'pizda',
          //   style: TextStyle(fontWeight: FontWeight.bold),
          // ),

          // TextField(
          //   decoration: InputDecoration(fillColor: Colors.black),
          //   controller: emailController,
          // ),
          RoundedInputField(
            password: false,
            // pass: changePass ? false : true,
            useController: emailController,
            hintText: 'Нэвтрэх нэр',
            onChanged: (value) {
              // string.add(value);
              // print(value);
            },
          ),
          RoundedInputField(
            password: true,
            onPressed: () {
              setState(() {
                changePass = !changePass;
              });
            },
            // pass: changePass,
            hintText: 'Нууц үг',
            onChanged: (value) {},
          ),
          //  FlatButton(
          //               onPressed: changePass=true;
          //               child: new Text(_obscureText ? "Show" : "Hide"))
          //         ,
          roundedButton(
              text: 'Нэвтрэх',
              press: () {
                Navigator.pushReplacementNamed(context, '/MainScreen');
              },
              textColor: Color.fromRGBO(120, 200, 30, 1))
        ],
      ),
    );
  }
}

// class UserJson {
//   String name;
//   UserJson({required this.name})
// }
