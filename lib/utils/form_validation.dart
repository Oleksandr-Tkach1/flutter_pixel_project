class FormValidation {
  static RegExp emailRegex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  static dynamic email(String value) {
    if (value.isEmpty) {
      return "Invalid email";
    }else if(emailRegex.hasMatch(value)){
      return null;
    }else {
      return "Invalid email";
    }
  }

  static dynamic password(String value) {
    if (value.isEmpty) {
      return "Invalid password";
    }else {
      return null;
    }
  }
}