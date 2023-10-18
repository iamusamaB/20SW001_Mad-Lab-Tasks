import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final String name;
  final String email;
  final String gender;
  final String dob;

  ResultScreen(
      {required this.name,
      required this.email,
      required this.gender,
      required this.dob});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Gender: $gender'),
            Text('Date of Birth: $dob'),
          ],
        ),
      ),
    );
  }
}
