import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test1/widgets/printPage.dart';

class BlueToothBody extends StatefulWidget {
  BlueToothBody({Key? key}) : super(key: key);

  @override
  State<BlueToothBody> createState() => _BlueToothBodyState();
}

class _BlueToothBodyState extends State<BlueToothBody> {
  final List<Map<String, dynamic>> data = [
    {'title': 'cabutry', 'price': 15, 'qty': 2},
    {'title': 'cabutsdasdasdry', 'price': 15, 'qty': 5},
    {'title': 'cabutry', 'price': 15, 'qty': 102},
    {'title': 'cabutry', 'price': 15, 'qty': 2},
    {'title': 'cabutry', 'price': 15, 'qty': 2},
  ];
  final f = NumberFormat("\$####,###.0", "en_US");

  @override
  Widget build(BuildContext context) {
    int _total = 0;
    _total = data
        .map((e) => e['price'] * e['qty'])
        .reduce(((value, element) => value + element));

    return Scaffold(
      appBar: AppBar(title: Text('piz')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                        subtitle: Text(
                            '${f.format(data[index]['price'])} x ${data[index]['qty']}'),
                        trailing: Text(f
                            .format(data[index]['price'] * data[index]['qty'])),
                        title: Text(data[index]['title'].toString(),
                            style: TextStyle(fontSize: 15)));
                  })),
            ),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.all(20),
            child: Row(children: [
              Text(
                "Total:${f.format(_total)}",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 80),
              Expanded(
                  child: TextButton.icon(
                      onPressed: () {
                      //   Navigator.push(context,
                      //       MaterialPageRoute(builder: (_) => PrintPage(data)));
                      },
                      icon: Icon(Icons.print),
                      label: Text('print')))
            ]),
          )
        ],
      ),
    );
  }
}
