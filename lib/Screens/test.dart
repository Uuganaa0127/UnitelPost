// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:blue_thermal_printer/blue_thermal_printer.dart';
// import 'package:flutter/services.dart';
// import 'package:path_provider/path_provider.dart';
// // import 'package:path_provider/path_provider.dart';

// // void main() => runApp(new test());

// class test extends StatefulWidget {
//   late final List<Map<String, dynamic>> data;
//   test(this.data);

//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// class _MyAppState extends State<test> {
//   BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

//   List<BluetoothDevice> _devices = [];
//   BluetoothDevice? _device;
//   // BluetoothDevice devcie
//   // var pizda;
//   bool _connected = false;
//   bool _pressed = false;
//   String? pathImage;

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//     initSavetoPath();
//   }

//   initSavetoPath() async {
//     //read and write
//     //image max 300px X 300px
//     final filename = 'yourlogo.png';
//     var bytes = await rootBundle.load("assets/bg_unitel.png");
//     String dir = (await getApplicationDocumentsDirectory()).path;
//     writeToFile(bytes, '$dir/$filename');
//     setState(() {
//       pathImage = '$dir/$filename';
//     });
//   }

//   Future<void> initPlatformState() async {
//     List<BluetoothDevice> devices = [];

//     try {
//       devices = await bluetooth.getBondedDevices();
//     } on PlatformException {
//       // TODO - Error
//     }

//     bluetooth.onStateChanged().listen((state) {
//       switch (state) {
//         case BlueThermalPrinter.CONNECTED:
//           setState(() {
//             _connected = true;
//             _pressed = false;
//           });
//           break;
//         case BlueThermalPrinter.DISCONNECTED:
//           setState(() {
//             _connected = false;
//             _pressed = false;
//           });
//           break;
//         default:
//           print(state);
//           break;
//       }
//     });

//     if (!mounted) return;
//     setState(() {
//       _devices = devices;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Blue Thermal Printer'),
//         ),
//         body: Container(
//           child: ListView(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text(
//                       'Device:',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     DropdownButton(
//                       items: _getDeviceItems(),
//                       onChanged: (value) => setState(() {
//                         _device = value! as BluetoothDevice?;
//                       }),
//                       value: _device,
//                     ),
//                     ElevatedButton(
//                       onPressed: _pressed
//                           ? null
//                           : _connected
//                               ? _disconnect
//                               : _connect,
//                       child: Text(_connected ? 'Disconnect' : 'Connect'),
//                     ),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.only(left: 10.0, right: 10.0, top: 50),
//                 child: ElevatedButton(
//                   onPressed: _connected ? _tesPrint : null,
//                   child: Text('TesPrint'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   List<DropdownMenuItem<BluetoothDevice>> _getDeviceItems() {
//     List<DropdownMenuItem<BluetoothDevice>> items = [];
//     if (_devices.isEmpty) {
//       items.add(DropdownMenuItem(
//         child: Text('NONE'),
//       ));
//     } else {
//       _devices.forEach((device) {
//         items.add(DropdownMenuItem(
//           child: Text(device.name.toString()),
//           value: device,
//         ));
//       });
//     }
//     return items;
//   }

//   void _connect() {
//     if (_device == null) {
//       show('No device selected.');
//     } else {
//       bluetooth.isConnected.then((isConnected) {
//         if (!isConnected!) {
//           bluetooth.connect(_device!).catchError((error) {
//             setState(() => _pressed = false);
//           });
//           setState(() => _pressed = true);
//         }
//       });
//     }
//   }

//   void _disconnect() {
//     bluetooth.disconnect();
//     setState(() => _pressed = true);
//   }

// //write to app path
//   Future<void> writeToFile(ByteData data, String path) {
//     final buffer = data.buffer;
//     return new File(path).writeAsBytes(
//         buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
//   }

//   void _tesPrint() async {
//     //SIZE
//     // 0- normal size text
//     // 1- only bold text
//     // 2- bold with medium text
//     // 3- bold with large text
//     //ALIGN
//     // 0- ESC_ALIGN_LEFT
//     // 1- ESC_ALIGN_CENTER
//     // 2- ESC_ALIGN_RIGHT
//     bluetooth.isConnected.then((isConnected) {
//       if (isConnected!) {
//         bluetooth.printNewLine();
//         bluetooth.printCustom('data', 3, 1);
//         bluetooth.printNewLine();
//         bluetooth.printImage(pathImage!); //path of your image/logo
//         bluetooth.printNewLine();
//         //bluetooth.printImageBytes(bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes));
//         bluetooth.printLeftRight("LEFT", "RIGHT", 0);
//         bluetooth.printLeftRight("LEFT", "RIGHT", 1);
//         bluetooth.printLeftRight("LEFT", "RIGHT", 1, format: "%-15s %15s %n");
//         bluetooth.printNewLine();
//         bluetooth.printLeftRight("LEFT", "RIGHT", 2);
//         bluetooth.printLeftRight("LEFT", "RIGHT", 3);
//         bluetooth.printLeftRight("LEFT", "RIGHT", 4);
//         bluetooth.printNewLine();
//         bluetooth.print3Column("Col1", "Col2", "Col3", 1);
//         bluetooth.print3Column("Col1", "Col2", "Col3", 1,
//             format: "%-10s %10s %10s %n");
//         bluetooth.printNewLine();
//         bluetooth.print4Column("Col1", "Col2", "Col3", "Col4", 1);
//         bluetooth.print4Column("Col1", "Col2", "Col3", "Col4", 1,
//             format: "%-8s %7s %7s %7s %n");
//         bluetooth.printNewLine();
//         String testString = " čĆžŽšŠ-H-ščđ";
//         bluetooth.printCustom(testString, 1, 1, charset: "windows-1250");
//         bluetooth.printLeftRight("Številka:", "18000001", 1,
//             charset: "windows-1250");
//         bluetooth.printCustom("Body left", 1, 0);
//         bluetooth.printCustom("Body right", 0, 2);
//         bluetooth.printNewLine();
//         bluetooth.printCustom("Thank You", 2, 1);
//         bluetooth.printNewLine();
//         bluetooth.printQRcode("Insert Your Own Text to Generate", 200, 200, 1);
//         bluetooth.printNewLine();
//         bluetooth.printNewLine();
//         bluetooth.paperCut();
//       }
//     });
//   }

//   Future show(
//     String message, {
//     Duration duration: const Duration(seconds: 3),
//   }) async {
//     await new Future.delayed(new Duration(milliseconds: 100));
//     // Scaffold.of(context).showSnackBar(
//     //   new SnackBar(
//     //     content: new Text(
//     //       message,
//     //       style: new TextStyle(
//     //         color: Colors.white,
//     //       ),
//     //     ),
//     //     duration: duration,
//     //   ),
//     // );
//   }
// }
