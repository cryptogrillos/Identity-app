import 'package:flutter/material.dart';
import 'list_challenges.dart';
import 'challenge_solver.dart';

void main() {
  runApp(const Challenges());
}

class Challenges extends StatelessWidget {
  const Challenges({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Challenges',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Challenges'),
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
              padding: const EdgeInsets.all(30),
              itemCount: challenges.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ChallengeSolver()),
                        );
                      },
                      child: Text(challenges[index]),
                      style: ElevatedButton.styleFrom(
                        textStyle: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        minimumSize: const Size(50, 75),
                        primary: Colors.green,
                        elevation: 5,
                        side: BorderSide(
                            color: Colors.green.shade400,
                            width: 2,
                            style: BorderStyle.solid),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        tapTargetSize: MaterialTapTargetSize.padded,
                      ),
                    ));
              })),
    );
  }
}
