import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:test1/widgets/textFieldContainer.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final useController;
  final bool password;
  final onPressed;
  // final IconData? Icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key? key,
    required this.password,
    required this.hintText,
    // this.icon,
    required this.onChanged,
    // required this.pass,
    this.useController,
    this.onPressed,
  }) : super(key: key);

  @override
  State<RoundedInputField> createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  bool pass = false;
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        // obscureText: passoword ? pass : false,
        obscureText: pass,
        scribbleEnabled: widget.password,
        controller: widget.useController,
        onChanged: widget.onChanged,

        decoration: InputDecoration(

            // icon: Icon(icon),

            suffixIcon: widget.password
                ? GestureDetector(
                    onTap: () {
                      debugPrint('pass$pass');
                      setState(() {
                        pass = !pass;
                      });
                    },
                    child: Icon(
                        pass == true ? Icons.visibility : Icons.visibility_off
                        // : Icons.safety_check
                        // color: Theme.of(context).primaryColor,
                        ))
                : null,
            fillColor: Colors.black,
            hintText: widget.hintText,
            border: InputBorder.none),
      ),
    );
  }
}
