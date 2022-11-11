// import 'package:flutter/material.dart';
// import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';
// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:flutter_bluetooth_basic/flutter_bluetooth_basic.dart';
// // import 'package:esc_pos_printer/esc_pos_printer.dart';

// class PrintPage extends StatefulWidget {
//   // PrintPage({Key? key}) : super(key: key);
//   late final List<Map<String, dynamic>> data;
//   PrintPage(this.data);
// // Print(this.data);
//   // PrintPage(List<Map<String, dynamic>> data);
//   // print(this.data);

//   @override
//   State<PrintPage> createState() => _PrintPageState();
// }

// class _PrintPageState extends State<PrintPage> {
//   PrinterBluetoothManager _printerManager = PrinterBluetoothManager();
//   List<PrinterBluetooth> _devices = [];
//   late String _deviceMsg;
//   BluetoothManager bluetoothManager = BluetoothManager.instance;

//   @override
//   void initState() {
//     bluetoothManager.state.listen((val) {
//       if (!mounted) return;
//       if (val == 12) {
//         print('on');
//         initPrinter();
//       } else if (val == 10) print('state is $val');
//       setState(() {
//         _deviceMsg = 'Bluetooth no pizda';
//       });
//     });
//     // print(widget.data);
//     // initPrinter();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: Text('print')),
//         body: _devices.isEmpty
//             ? Center(
//                 child: Text(_deviceMsg ?? ''),
//               )
//             : ListView.builder(itemBuilder: (c, i) {
//                 return ListTile(
//                     leading: Icon(Icons.print),
//                     title: Text(_devices[i].name.toString()),
//                     subtitle: Text(_devices[i].address.toString()),
//                     onTap: () {
//                       _devices[i];
//                     });
//               }));
//   }

//   void initPrinter() {
//     _printerManager.startScan(Duration(seconds: 2));
//     _printerManager.scanResults.listen((val) {
//       if (!mounted) return;
//       setState(() {
//         _devices = val;
//       });
//       print('pizda$_devices');
//       if (_devices.isEmpty)
//         setState(() {
//           _deviceMsg = 'noDevices';
//         });
//     });
//   }

//   Future<void> _startPrint(PrinterBluetooth printer) async {
//     final profile = await CapabilityProfile.load();
//     _printerManager.selectPrinter(printer);
//     final result = await _printerManager.printTicket([0], queueSleepTimeMs: 50);
//     print('pizda$result');
//   }

//   Future<Generator> _ticket(PaperSize paper) async {
//     final profile = await CapabilityProfile.load();

//     final ticket = Generator(paper, profile);
//     ticket.text('test');
//     ticket.cut();
//     return ticket;
//   }
// }
















// // import 'package:bluetooth_print/bluetooth_print.dart';
// // import 'package:bluetooth_print/bluetooth_print_model.dart';
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';

// // class PrintPage extends StatefulWidget {
// //   // const PrintPage({Key? key, required this.data}) : super(key: key);
// //   final List<Map<String, dynamic>> data;
// //    PrintPage(this.data);

// //   @override
// //   State<PrintPage> createState() => _PrintPageState();
// // }

// // class _PrintPageState extends State<PrintPage> {
// //   BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
// //   List<BluetoothDevice> _devices = [];
// //   String _deviceMsg = "";
// //   final f = NumberFormat("\$###,###.00", "en_US");

// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addPostFrameCallback((_) => {initPrinter()});
// //   }

// //   Future<void>? initPrinter() async {
// //     bluetoothPrint.startScan(timeout: Duration(seconds: 2));
// //     if (!mounted) return;
// //     bluetoothPrint.scanResults.listen((val) {
// //       if (!mounted) return;
// //       setState(() {
// //         _devices = val;
// //         if (_deviceMsg.isEmpty) {
// //           setState(() {
// //             _deviceMsg = "No Devices";
// //           });
// //         }
// //       });
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: Text('printeree songno uu'),
// //           backgroundColor: Colors.redAccent,
// //         ),
// //         body: _devices.isEmpty
// //             ? Center(
// //                 child: Text(_deviceMsg ?? ''),
// //               )
// //             : ListView.builder(
// //                 itemCount: _devices.length,
// //                 itemBuilder: (c, i) {
// //                   return ListTile(
// //                     leading: Icon(Icons.print),
// //                     title: Text(_devices[i].name.toString()),
// //                     subtitle: Text(_devices[i].address.toString()),
// //                     onTap: () {},
// //                   );
// //                 }));
// //   }
// // }
