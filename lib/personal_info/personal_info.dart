import 'package:flutter/material.dart';
import 'personal_info_list.dart';

void main() {
  runApp(const PersonalInfo());
}

class PersonalInfo extends StatelessWidget {
  const PersonalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal info',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Personal info'),
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
      body: Center(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: personal_info.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.amber,
                  child: Center(child: Text('Entry ${personal_info[index]}')),
                );
              })),
    );
  }
}
