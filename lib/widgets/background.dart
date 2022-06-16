import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // size нь дэлгэцний бүхэ хэмжээг харуулна.
    return Material(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        // resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: true,
        backgroundColor: Color.fromRGBO(120, 200, 30, 1),
        body: SingleChildScrollView(
          // reverse: true,
          child: Container(
              height: size.height,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Positioned(
                    top: 50,
                    left: 0,
                    child: Image.asset("assets/images/bg_unitel.png"),
                    width: size.width * 1,
                  ),
                  Positioned(
                    child: child,
                    top: 300,
                  ),
                  // child,
                ],
              )),
        ),
      ),
    );
  }
}
