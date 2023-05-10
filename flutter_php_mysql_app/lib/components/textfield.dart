import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.hintText,
      required this.labelText,
      required this.obscured,
      required this.InputController});

  final String hintText;
  final String labelText;
  final bool obscured;
  final TextEditingController InputController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: InputController,
        validator: (value) {
          if (value!.isEmpty) {
            return "$labelText is required";
          }
        },
        obscureText: obscured,
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 3, color: Colors.blueAccent),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.blueAccent)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.red)),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 3, color: Colors.red))),
      ),
    );
  }
}
