import 'dart:developer';

import 'package:feildtest/commonButton.dart';
import 'package:feildtest/commonTextFields.dart';
import 'package:fields_validate/fields_validate.dart';
import 'package:fields_validate/models/filedOperation.dart';
import 'package:fields_validate/models/filedParaModel.dart';
import 'package:flutter/foundation.dart';
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
      title: 'Field Validate Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Your Field Validate'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController cName = TextEditingController();
  TextEditingController cEmail = TextEditingController();
 GlobalKey<ScaffoldMessengerState> snackbarKek =  GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CommonTextField(hintText: "Your Name", textC: cName),
              const SizedBox(
                height: 10,
              ),
              CommonTextField(hintText: "Your Email", textC: cEmail),
               const SizedBox(
                height: 20,
              ),

               CommonButton(buttonText: "Click to test", click: (){
                checkField();
                
              },)
            ],
          ),
        ),
      ),
    );
  }


  Future checkField()async{
    try {
        List<FiledPara> filedList =[];
        filedList.add(FiledPara(FiledOperation.isEmpty, cName.text.trim(), "", "", "Please enter your name"));
        bool result =await FiledValidate(snackbarKek).validateFileds(validateFiledsList: filedList);
        if(result){
          if (kDebugMode) {
            print("success");
          }
        }
    } catch (err) {
      log(err.toString());
    }
  }
}
