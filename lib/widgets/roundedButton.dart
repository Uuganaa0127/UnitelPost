import 'package:flutter/material.dart';

class roundedButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color, textColor;
  const roundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = const Color.fromRGBO(150, 200, 150, 1),
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: ElevatedButton(
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(color: textColor),
          ),
          // padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          // color: color,
        ),
      ),
    );
  }
}
