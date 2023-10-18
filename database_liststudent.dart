import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ListStudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Students'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: getStudents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index]['name']),
                subtitle: Text('Age: ${snapshot.data![index]['age']}'),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>> getStudents() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), 'student_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE students(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
        );
      },
      version: 1,
    );

    final List<Map<String, dynamic>> students =
        await database.query('students');

    return students;
  }
}
