import 'package:flutter/material.dart';
import 'package:test1/widgets/left_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: left_menu(),
    );
  }
}
