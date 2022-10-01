class FormValidation {
  static dynamic email(String value) {
    if (value.isEmpty && value == null) {
      return "Invalid email";
    }else if(value.contains('@')){
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