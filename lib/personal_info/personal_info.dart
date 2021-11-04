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
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: personalInfo.length,
              itemBuilder: (BuildContext context, int index) {
                String key = personalInfo.keys.elementAt(index);
                String? val = personalInfo[key];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                        width: double.infinity,
                        height: 70.0,
                        child: ListTile(
                          title: Text("$val"),
                          subtitle: Text(key),
                          onTap: null,
                          trailing: Text(
                            'Edit',
                            textAlign: TextAlign.end,
                            style: TextStyle(color: Colors.lightBlue),
                          ),
                        ))
                  ],
                );
              }),
        ),
        Flexible(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text("Add new"),
            style: ElevatedButton.styleFrom(
              textStyle:
                  const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
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
    );
  }
}
