import 'package:flutter/material.dart';
import 'sharing_info.dart';
import '../login/dashboard_screen.dart';

void main() {
  runApp(const ChallengeSolver());
}

class ChallengeSolver extends StatelessWidget {
  const ChallengeSolver({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenge solver',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Challenge solver'),
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 50),
                  Text("What bear is best?"),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Answer',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SharingInfo()),
                      );
                    },
                    child: Text('Solve'),
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
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DashboardScreen()),
                      );
                    },
                    child: Text('Reject'),
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      minimumSize: const Size(100, 100),
                      primary: Colors.red,
                      elevation: 5,
                      side: BorderSide(
                          color: Colors.red.shade400,
                          width: 2,
                          style: BorderStyle.solid),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      tapTargetSize: MaterialTapTargetSize.padded,
                    ),
                  )
                ])));
  }
}
