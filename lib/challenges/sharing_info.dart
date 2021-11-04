import 'package:flutter/material.dart';
import '../personal_info/personal_info_list.dart';
import 'dart:convert';
import 'qrcode.dart';

void main() {
  runApp(const SharingInfo());
}

class SharingInfo extends StatelessWidget {
  const SharingInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sharing info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Sharing info'),
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
  List<bool>? _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(personalInfo.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: personalInfo.length,
                      itemBuilder: (BuildContext context, int index) {
                        String detailInfo = personalInfo.keys.elementAt(index);
                        return CheckboxListTile(
                          title: Text(detailInfo),
                          value: _isChecked![index],
                          onChanged: (val) {
                            setState(
                              () {
                                _isChecked![index] = val!;
                              },
                            );
                          },
                        );
                      })),
            ),
            Flexible(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Qrcode("Data del usuario")),
                  );
                },
                child: const Text("Generate QR"),
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold),
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
            )
          ],
        ));
  }
}
