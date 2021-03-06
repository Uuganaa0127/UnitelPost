import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      reverse: true,
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          width: size.width * 0.8,
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(29)),
          child: child),
    );
  }
}
