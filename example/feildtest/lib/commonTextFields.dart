// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController textC;
  const CommonTextField({super.key , required this.hintText, required  this.textC});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textC,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: hintText,
          fillColor: Colors.white70),
    );
  }
}
