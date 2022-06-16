import 'package:flutter/material.dart';
import 'package:test1/Screens/login.dart';
import 'package:test1/Screens/test.dart';
import 'package:test1/widgets/background.dart';
import 'package:test1/widgets/roundedButton.dart';

class body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: Column(children: <Widget>[
        // Text('pizda'),
        roundedButton(
          textColor: Colors.black,
          text: 'login',
          press: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return login();
            }));
          },
        ),
        SizedBox(
          height: 10,
        ),
        roundedButton(
          textColor: Colors.black,
          text: 'login',
          color: Colors.blue,
          press: () {},
        ),
      ]),
    );
  }
}
