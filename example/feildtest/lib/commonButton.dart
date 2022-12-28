// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback click;
  const CommonButton({super.key , required this.buttonText , required this.click});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:click,style: ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(18.0),
      side: const BorderSide(color: Colors.black)
    )
  )
), child:  Text(buttonText));
  }
}
