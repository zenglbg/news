bool lbIsEmail(String? input) {
  if (input == null || input.isEmpty) return false;
  String regEmail = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*\$";
  return RegExp(regEmail).hasMatch(input);
}

bool lbCheckStringLength(String? input, int length) {
  if (input == null || input.isEmpty) return false;
  return input.length >= length;
}
