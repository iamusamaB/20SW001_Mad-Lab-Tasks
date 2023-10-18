import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_app/auth_service.dart';
// import 'package:flutter_firebase/auth.dart';

class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  TextEditingController emailcontrller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namec = TextEditingController();
  TextEditingController agec = TextEditingController();
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection(
    "users",
  );

  signUp() async {
    final AuthService authService = AuthService();
    String info =
        await authService.signUp(emailcontrller.text, passwordcontroller.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(info)));
    users.add({
      'name': namec.text,
      'age': agec.text,
      'email': emailcontrller.text,
    });
  }

  signIn() async {
    final AuthService authService = AuthService();
    String info =
        await authService.signIn(emailcontrller.text, passwordcontroller.text);
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(info)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: namec,
              decoration: const InputDecoration(
                  labelText: "enter name",
                  hintText: "name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: agec,
              decoration: const InputDecoration(
                  labelText: "enter age",
                  hintText: "Age",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: emailcontrller,
              decoration: const InputDecoration(
                  labelText: "enter email",
                  hintText: "email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)))),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: passwordcontroller,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "enter password",
                  hintText: "password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)))),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: signUp,
              child: Text("Sign UP"),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: signIn,
              child: const Text("Sign in"),
            )
          ],
        ),
      ),
    );
  }
}
