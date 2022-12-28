// ignore_for_file: file_names

enum FiledOperation {
  isEmpty(1),
  isEmail(2),
  isMobile(3),
  isPassWord(4);

  const FiledOperation(this.value);
  final num value;
}