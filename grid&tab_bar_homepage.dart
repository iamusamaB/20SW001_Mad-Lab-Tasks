import 'package:flutter/material.dart';
import 'Details.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        body: Column(
          children: [
            const Text("Welcome to Home Page"),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Details(),
                  ));
                },
                child: const Text("Click"))
          ],
        ));
  }
}
