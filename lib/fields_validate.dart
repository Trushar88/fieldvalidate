// ignore_for_file: non_constant_identifier_names

import 'dart:developer';
import 'package:fields_validate/models/filedOperation.dart';
import 'package:flutter/material.dart';
import 'models/filedParaModel.dart';

class FiledValidate {
  final GlobalKey<ScaffoldMessengerState> snackbarKey;
  FiledValidate( this.snackbarKey );


  Future<bool> validateFileds({required List<FiledPara> validateFiledsList}) async {

    
    List<bool> isValid = [];
    for (int i = 0; i < validateFiledsList.length; i++) {
      if (validateFiledsList[i].operation == FiledOperation.isEmpty) {
        if (validateFiledsList[i].filed1.trim().isEmpty) {
          showFieldWarningSnackBar(validateFiledsList[i].warningTitle ?? "", validateFiledsList[i].warningMessage ?? "");
          return false;
        } else {
          isValid.add(true);
        }
      } else if (validateFiledsList[i].operation == FiledOperation.isEmail) {
        if (validateFiledsList[i].filed1.trim().isEmpty) {
          showFieldWarningSnackBar(validateFiledsList[i].warningTitle ?? "", validateFiledsList[i].warningMessage ?? "");
          return false;
        } else {
          if (ValidateEmailAddress(validateFiledsList[i].filed1.trim())) {
            isValid.add(true);
          } else {
            showFieldWarningSnackBar(validateFiledsList[i].warningTitle ?? "", validateFiledsList[i].warningMessage ?? "");
            return false;
          }
        }
      } else if (validateFiledsList[i].operation == FiledOperation.isMobile) {
        if (validateFiledsList[i].filed1.trim().isEmpty) {
          showFieldWarningSnackBar(validateFiledsList[i].warningTitle ?? "", validateFiledsList[i].warningMessage ?? "");
          return false;
        } else {
          if (ValidateMobileNumber(validateFiledsList[i].filed1.trim())) {
            isValid.add(true);
          } else {
            showFieldWarningSnackBar(validateFiledsList[i].warningTitle ?? "", validateFiledsList[i].warningMessage ?? "");
            return false;
          }
        }
      } else if (validateFiledsList[i].operation == FiledOperation.isPassWord) {
        if (validateFiledsList[i].filed1.trim().isEmpty) {
          showFieldWarningSnackBar(validateFiledsList[i].warningTitle ?? "", validateFiledsList[i].warningMessage ?? "");
          return false;
        } else if (validateFiledsList[i].filed2.trim().isEmpty) {
          showFieldWarningSnackBar(validateFiledsList[i].warningTitle ?? "", validateFiledsList[i].warningMessage ?? "");
          return false;
        } else if (validateFiledsList[i].filed1.trim() != validateFiledsList[i].filed2.trim()) {
          showFieldWarningSnackBar(validateFiledsList[i].warningTitle ?? "", validateFiledsList[i].warningMessage ?? "");
          return false;
        } else {
          isValid.add(true);
        }
      }
    }

    return isValid.contains(false) ? false : true;
  }

  bool ValidateMobileNumber(String value) {
    String pattern = r'^(?:[+0][1-9])?[0-9]{9,14}$';
    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(value);
  }

  bool ValidateEmailAddress(String value) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);

    return !regExp.hasMatch(value);
  }

  showFieldWarningSnackBar(String title, String message) async {
    try {
      final SnackBar snackBar = SnackBar(
          content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(message),
          const Icon(
            Icons.warning,
            color: Colors.orange,
          )
        ],
      ));
      return snackbarKey.currentState?.showSnackBar(snackBar);
    } catch (err) {
      log("BaseController showFieldWarningSnackBar $err");
    }
  }
}




