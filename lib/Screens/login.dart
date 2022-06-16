import 'package:flutter/material.dart';
import 'package:test1/widgets/loginBody.dart';

class login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return loginBody();
  }
}
