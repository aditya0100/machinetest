String? emailValidator(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "Please enter a email";
  } else if (!regex.hasMatch(value)) {
    return 'Email format is invalid';
  }
  return null;
}

String? textValidator(String? value) {
  if (value!.isEmpty) {
    return "Field cannot be empty";
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value!.isEmpty) {
    return "Please enter a password";
  } else if (value.length < 8) {
    return 'Minimum 8 characters';
  } else if (value.length > 16) {
    return 'Maximum 16 characters';
  }
  return null;
}
