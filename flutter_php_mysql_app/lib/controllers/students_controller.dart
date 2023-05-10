import 'dart:convert';
import 'package:flutter_php_mysql_app/models/students_model.dart';
import 'package:http/http.dart' as http;

class StudentController {
  static const view_uri =
      "http://[your-ip-address]/php-flutter-students-api/view.php";
  static const create_uri =
      "http://[your-ip-address]/php-flutter-students-api/create.php";
  static const delete_uri =
      "http://[your-ip-address]/php-flutter-students-api/delete.php";
  static const update_uri =
      "http://[your-ip-address]/php-flutter-students-api/update.php";
  List<StudentModel> studentsFromJson(String jsonstring) {
    final data = json.decode(jsonstring);
    return List<StudentModel>.from(
        data.map((item) => StudentModel.fromJson(item)));
  }

  Future<List<StudentModel>> getStudents() async {
    final response = await http.get(Uri.parse(view_uri));
    if (response.statusCode == 200) {
      List<StudentModel> list = studentsFromJson(response.body);
      return list;
    } else {
      print('Fail');
      return <StudentModel>[];
    }
  }

  Future<String> addStudent(StudentModel studentModel) async {
    final response =
        await http.post(Uri.parse(create_uri), body: studentModel.toJsonAdd());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "error";
    }
  }

  Future<String> updateStudent(StudentModel studentModel) async {
    final response = await http.post(Uri.parse(update_uri),
        body: studentModel.toJsonUpdateDelete());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "error";
    }
  }

  Future<String> deleteStudent(StudentModel studentModel) async {
    final response = await http.post(Uri.parse(delete_uri),
        body: studentModel.toJsonUpdateDelete());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return "error";
    }
  }
}
