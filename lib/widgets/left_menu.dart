import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test1/widgets/bluetoothBody.dart';
import 'package:test1/widgets/printPage.dart';

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

class left_menu extends StatefulWidget {
  const left_menu({Key? key}) : super(key: key);

  @override
  State<left_menu> createState() => _left_menuState();
}

class _left_menuState extends State<left_menu>
    with SingleTickerProviderStateMixin {
  final Color backgroundColor = Color.fromRGBO(236, 236, 236, 1);
  int Screen = 0;
  bool isCollapsed = true;
  // List<Set> itemList = [
  //   {'pizda:pizd'}
  // ];
  List itemList = [
    {'pizda1': 'pizda1'},
    {'pizda1': 'pizda2'},
    {'pizda1': 'pizda3'},
    {'pizda1': 'pizda4'},
    {'pizda1': 'pizda5'},
    {'pizda1': 'pizda6'},
    {'pizda1': 'pizda7'},
    {'pizda1': 'pizda7'},
    {'pizda1': 'pizda7'},
    {'pizda1': 'pizda7'},
  ];

  late double screenWidth, screenHeigth;
  final Duration duration = const Duration(milliseconds: 300);
  AnimationController? _controller;
  Animation<double>? _scaleAnimation;
  Animation<double>? _menuScaleAnimation;
  Animation<Offset>? _slideAnimation;
  // final Color backgroundColor = Colors.green;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.6).animate(_controller!);
    _menuScaleAnimation =
        Tween<double>(begin: 0.5, end: 1).animate(_controller!);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(_controller!);
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeigth = size.height;
    screenWidth = size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: <Widget>[menu(context), dashboard(context)],
      ),
    );
  }

  Widget menu(context) {
    return SlideTransition(
      position: _slideAnimation!,
      child: ScaleTransition(
        scale: _menuScaleAnimation!,
        child: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: (() {
                      setState(() {
                        Screen = 0;
                      });
                    }),
                    child: Text('Карт Цэнэглэх',
                        style: TextStyle(
                            color: Color.fromRGBO(120, 200, 30, 1),
                            fontSize: 18)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Screen = 1;
                      });
                    },
                    child: Text('Дийлэр цэнэглэх',
                        style: TextStyle(
                            color: Color.fromRGBO(120, 200, 30, 1),
                            fontSize: 18)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/test');
                    },
                    child: Text('Гэрээтийн бүртгэл харах',
                        style: TextStyle(
                            color: Color.fromRGBO(120, 200, 30, 1),
                            fontSize: 18)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Үлдэгдэл татах',
                      style: TextStyle(
                          color: Color.fromRGBO(120, 200, 30, 1),
                          fontSize: 18)),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => BlueToothBody()));
                    },
                    child: Text('hewleh',
                        style: TextStyle(
                            color: Color.fromRGBO(120, 200, 30, 1),
                            fontSize: 18)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Гарах',
                      style: TextStyle(
                          color: Color.fromRGBO(120, 200, 30, 1),
                          fontSize: 18)),
                  SizedBox(
                    height: 10,
                  ),
                  BottomModal()
                  // bluetooth()
                ]),
          ),
        ),
      ),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.4 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      duration: duration,
      child: ScaleTransition(
        scale: _scaleAnimation!,
        child: Material(
          animationDuration: const Duration(milliseconds: 3000),
          borderRadius: BorderRadius.all(Radius.circular(30)),
          elevation: 8,
          color: backgroundColor,
          child: SingleChildScrollView(
            // physics: NeverScrollableScrollPhysics(),
            physics: ClampingScrollPhysics(),
            // scrollDirection: Axis.vertical,
            child: Container(
              padding: const EdgeInsets.only(left: 14, right: 16, top: 48),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (isCollapsed)
                                  _controller?.forward();
                                else
                                  _controller?.reverse();
                                isCollapsed = !isCollapsed;
                              });
                            },
                            child: Icon(
                              Icons.menu,
                              color: Color.fromRGBO(120, 200, 30, 1),
                            ),
                          ),
                          Text(
                            'Карт түгээлт',
                            style: TextStyle(
                                fontSize: 24,
                                color: Color.fromRGBO(120, 200, 30, 1)),
                          ),
                          Icon(
                            Icons.settings,
                            color: Color.fromRGBO(120, 200, 30, 1),
                          )
                        ]),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      height: 200,
                      child: PageView(
                        controller: PageController(viewportFraction: 0.8),
                        scrollDirection: Axis.horizontal,
                        pageSnapping: true,
                        children: <Widget>[
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.redAccent,
                            width: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.blueAccent,
                            width: 100,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.greenAccent,
                            width: 100,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Карт1',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    if (Screen == 0)
                      ...itemList.map(
                        (item) {
                          // final item1 = item['pizda1'];
                          // final b = itemList.first(item);
                          int a = itemList.indexOf(item);
                          // itemList.forEach(item);
                          // {
                          //   print(item['pizda1']);
                          // }
                          // print('b$b');
                          return Center(
                            child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Container(
                                    width: 70,
                                    child: Column(
                                      children: [
                                        Text(a == 0
                                            ? 'data'
                                            : item['pizda1'].toString()),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 70,
                                    child: Column(
                                      children: [
                                        Text(a == 0
                                            ? 'data'
                                            : item['pizda1'].toString()),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 70,
                                    child: Column(
                                      children: [
                                        FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(a == 0
                                                ? 'data'
                                                : item['pizda1'].toString())),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 70,
                                    child: Column(
                                      children: [
                                        FittedBox(
                                            fit: BoxFit.fitWidth,
                                            child: Text(a == 0
                                                ? 'data'
                                                : item['pizda1'].toString())),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                    //  ...itemList.map(
                    //   (item) {
                    //     return  Center(
                    //   child: Align(
                    //     alignment: Alignment.center,
                    //     child: Row(
                    //       children: [
                    //         Container(
                    //           width: 70,
                    //           child: Column(
                    //             children: [
                    //               Text(item),
                    //             ],
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Container(
                    //           width: 70,
                    //           child: Column(
                    //             children: [
                    //               Text('data'),
                    //             ],
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Container(
                    //           width: 70,
                    //           child: Column(
                    //             children: [
                    //               Text('data'),
                    //             ],
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //         Container(
                    //           width: 70,
                    //           child: Column(
                    //             children: [
                    //               Text('data'),
                    //             ],
                    //           ),
                    //         ),
                    //         SizedBox(
                    //           width: 10,
                    //         ),
                    //       ],

                    //   ),),
                    //   );
                    // },).toList()
                    // ...itemList.map(
                    //   (item) {
                    //     return
                    //    Text(
                    //     item.toString(),
                    //     style: TextStyle(fontSize: 20),
                    //   );
                    // }).toList()
                    // ListView.separated(
                    //     // scrollDirection: Axis.vertical,
                    //     // physics: const NeverScrollableScrollPhysics(),
                    //     shrinkWrap: true,
                    //     // primary: false,
                    //     itemBuilder: (context, index) {
                    //       return const ListTile(
                    //         title: Text(
                    //           'asdasdasdasss',
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //       );
                    //     },
                    //     separatorBuilder: (context, index) {
                    //       return Divider(
                    //         height: 16,
                    //       );
                    //     },
                    //     itemCount: 10)
                    else if (Screen == 1)
                      SizedBox(
                        height: 10,
                      ),
                    // bluetooth()
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget BottomModal() {
    return Center(
      child: Align(
        alignment: Alignment.centerLeft,
        child: InkWell(
          child: const Text(
            'showModalBottomSheet',
            style: TextStyle(color: Color.fromRGBO(120, 200, 30, 1)),
          ),
          onTap: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: 200,
                  color: Color.fromRGBO(200, 200, 200, 1),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text('Modal BottomSheet'),
                        ElevatedButton(
                          child: const Text('Close BottomSheet'),
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
