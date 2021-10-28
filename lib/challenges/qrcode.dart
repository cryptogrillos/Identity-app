import 'package:flutter/material.dart';
import '../login/dashboard_screen.dart';

void main() {
  runApp(const Qrcode());
}

class Qrcode extends StatelessWidget {
  const Qrcode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qrcode',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Qrcode'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'images/download.png',
              width: 300,
              height: 300,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()),
                );
              },
              child: const Text("Return to home"),
              style: ElevatedButton.styleFrom(
                textStyle:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                minimumSize: const Size(100, 100),
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
          ]),
    );
  }
}
