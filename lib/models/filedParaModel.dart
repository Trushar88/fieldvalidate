// ignore_for_file: file_names, unused_import

import 'package:fields_validate/models/filedOperation.dart';

import '../fields_validate.dart';

class FiledPara {
  late FiledOperation operation;
  late String filed1;
  late String filed2;
  late String? warningTitle;
  late String? warningMessage;

  FiledPara(this.operation, this.filed1, this.filed2, this.warningTitle, this.warningMessage);
}