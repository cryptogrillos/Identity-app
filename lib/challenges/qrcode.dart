import 'package:flutter/material.dart';
import '../dashboard_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrcode extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Qrcode(this.mydata);
  final String mydata;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qrcode',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage('Qrcode', mydata),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const MyHomePage(this.title, this.mydat);
  final String title;
  final String mydat;

  @override
  State<MyHomePage> createState() =>
      // ignore: no_logic_in_create_state
      _MyHomePageState(title: title, mydat: mydat);
}

class _MyHomePageState extends State<MyHomePage> {
  final String title;
  final String mydat;
  _MyHomePageState({required this.title, required this.mydat});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: QrImage(
                    data: mydat,
                    version: QrVersions.auto,
                    size: 300.0,
                  ),
                ),
                Flexible(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardScreen()),
                      );
                    },
                    child: const Text("Return to home"),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      minimumSize: const Size(100, 75),
                      primary: Colors.blue,
                      elevation: 5,
                      side: BorderSide(
                          color: Colors.blue.shade400,
                          width: 2,
                          style: BorderStyle.solid),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      tapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  ),
                )
              ]),
        ));
  }
}
