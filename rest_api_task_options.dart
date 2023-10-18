import 'package:flutter/material.dart';
import 'package:google_maps/RestApi/rest_api.dart';
import 'package:google_maps/main.dart';

class TaskOptions extends StatelessWidget {
  const TaskOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyMap()));
                },
                child: Text("Maps Tasks")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Text("Rest Api")),
          ],
        ),
      ),
    );
  }
}
