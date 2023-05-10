import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_php_mysql_app/controllers/students_controller.dart';
import 'package:flutter_php_mysql_app/models/students_model.dart';
import 'package:flutter_php_mysql_app/screens/add_edit_student_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({super.key});

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  List<StudentModel> studentList = [];

  StreamController _streamController = StreamController();

  Future getAllStudents() async {
    studentList = await StudentController().getStudents();
    _streamController.sink.add(studentList);
  }

  deleteStudent(StudentModel studentModel) async {
    await StudentController()
        .deleteStudent(studentModel)
        .then((Success) => {
              Fluttertoast.showToast(
                  msg: "Student is Deleted Successfully",
                  backgroundColor: Colors.green)
            })
        .onError((error, stackTrace) => {
              Fluttertoast.showToast(
                  msg: "Student is not been Deleted",
                  backgroundColor: Colors.red)
            });
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      getAllStudents();
    });
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) =>
                      AddEditStudentPage(studentModel: null))));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text('All Students')),
      body: SafeArea(
          child: StreamBuilder(
        stream: _streamController.stream,
        builder: (context, snapshots) {
          if (snapshots.hasData) {
            return ListView.builder(
                itemCount: studentList.length,
                itemBuilder: ((contect, index) {
                  StudentModel student = studentList[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => AddEditStudentPage(
                                    studentModel: student,
                                    index: index,
                                  ))));
                    },
                    leading: CircleAvatar(
                      child: Text(student.name[0].toString()),
                    ),
                    title: Text(student.name),
                    subtitle: Text(student.email),
                    trailing: IconButton(
                        onPressed: () {
                          deleteStudent(student);
                        },
                        icon: Icon(
                          Icons.delete_outline,
                          color: Colors.red,
                        )),
                  );
                }));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      )),
    );
  }
}
