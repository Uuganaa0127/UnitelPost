import 'package:flutter/material.dart';
import 'package:test1/Screens/SplashScreen.dart';
import 'package:test1/Screens/login.dart';
import 'package:test1/Screens/mainScreen.dart';
import 'package:test1/Screens/onBoarding.dart';
import 'package:test1/Screens/test.dart';
import 'package:test1/widgets/printPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(primary: const Color(0xFF343A40)),
            scaffoldBackgroundColor: Color.fromRGBO(255, 236, 236, 1)),
        // home: SplashScreen(),
        initialRoute: '/',
        routes: {
          '/': (context) => login(),
          '/login': (context) => login(),
          // '/test': ((context) => test()),
          '/onBoarding': ((context) => const onBoarding()),
          '/MainScreen': ((context) => const MainScreen()),
          // '/blueTooth': ((context) => const PrintPage(data: [],)),
        });
  }
}
