import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHome());
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  // double scale = 1.0;
  Offset offset = const Offset(0.0, 0.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestures example"),
      ),
      body: GestureDetector(
        onTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("On Tap Detect")));
        },
        onDoubleTap: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Double Tab Detect")));
        },
        onLongPress: () {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Long Press Detect")));
        },
        onPanUpdate: (details) {
          setState(() {
            offset = Offset(
                offset.dx + details.delta.dx, offset.dy + details.delta.dy);
          });
        },
        child: Transform.translate(
          offset: offset,
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
