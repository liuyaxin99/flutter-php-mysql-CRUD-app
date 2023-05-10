import 'package:flutter/material.dart';
import 'package:flutter_php_mysql_app/components/textfield.dart';
import 'package:flutter_php_mysql_app/controllers/students_controller.dart';
import 'package:flutter_php_mysql_app/models/students_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddEditStudentPage extends StatefulWidget {
  const AddEditStudentPage({super.key, required this.studentModel, this.index});
  final StudentModel? studentModel;
  final index;

  @override
  State<AddEditStudentPage> createState() => _AddEditStudentPageState();
}

class _AddEditStudentPageState extends State<AddEditStudentPage> {
  bool isEdit = false;
  final _form_key = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController idController = TextEditingController();

  AddStudent(StudentModel studentModel) async {
    await StudentController().addStudent(studentModel).then((Success) => {
          Navigator.pop(context),
          Fluttertoast.showToast(
              msg: "Student is created successfully",
              backgroundColor: Colors.green),
        });
  }

  UpdateStudent(StudentModel studentModel) async {
    await StudentController()
        .updateStudent(studentModel)
        .then((Success) => {
              Navigator.pop(context),
              Fluttertoast.showToast(
                  msg: "Student is updated successfully",
                  backgroundColor: Colors.green),
            })
        .onError((error, stackTrace) => {
              Fluttertoast.showToast(
                  msg: "Student is not been Updated",
                  backgroundColor: Colors.red)
            });
  }

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      isEdit = true;
      nameController.text = widget.studentModel?.name;
      emailController.text = widget.studentModel?.email;
      phoneController.text = widget.studentModel?.phone;
      idController.text = widget.studentModel?.id;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(isEdit ? 'Update a Student' : 'Add a Student'),
          centerTitle: true),
      body: Column(children: [
        SizedBox(height: 30),
        Form(
          key: _form_key,
          child: Column(
            children: [
              MyTextField(
                  hintText: "Full name",
                  labelText: "Name",
                  obscured: false,
                  InputController: nameController),
              SizedBox(height: 10.0),
              MyTextField(
                  hintText: "Example@email.com",
                  labelText: "Email",
                  obscured: false,
                  InputController: emailController),
              SizedBox(height: 10.0),
              MyTextField(
                  hintText: "Phone number",
                  labelText: "Phone",
                  obscured: false,
                  InputController: phoneController),
            ],
          ),
        ),
        SizedBox(height: 10.0),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                fixedSize: Size(200.0, 50), elevation: 20.0),
            onPressed: () {
              if (isEdit == true) {
                if (_form_key.currentState!.validate()) {
                  StudentModel studentModel = StudentModel(
                      id: idController.text,
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text);
                  UpdateStudent(studentModel);
                  nameController.clear();
                  emailController.clear();
                  phoneController.clear();
                }
              } else {
                if (_form_key.currentState!.validate()) {
                  StudentModel studentModel = StudentModel(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text);
                  AddStudent(studentModel);
                  nameController.clear();
                  emailController.clear();
                  phoneController.clear();
                }
              }
            },
            child: Text(isEdit ? "Update" : "Save"))
      ]),
    );
  }
}
