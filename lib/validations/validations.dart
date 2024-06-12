
class Validators {
  //check is the given string is empty or not
  static String? isEmpty(String value, String? errorText) {
    if (value.isEmpty) {
      return errorText ?? "This field is required";
    } else {
      return null;
    }
  }

  //check is the given string is email or not
  static String? isEMail(String value) {
    if (value.isEmpty) {
      return "This field is required";
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+")
        .hasMatch(value)) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }
   //check is the given 2 string are same
  static String? isSameAs(
      {required String? value,
      required String? confirmText,
      String? errorText}) {
    if ((value ?? "").isEmpty) {
      return "This field is required";
    } else if (value != confirmText) {
      return errorText ?? "Both field has to be same";
    } else {
      return null;
    }
  }
  //check is the given string is ,mobile or not
  static String? isMobile(String value, int minLength, int maxLength) {
    if (value.isEmpty) {
      return "This field is required";
    } else if (value.length > maxLength) {
      return "Please enter a valid mobile number";
    } else if (value.length < minLength) {
      return "Please enter a valid mobile number";
    } else {
      return null;
    }
  }

//check is the given string is valid password or not
  static String? isPassword(String value) {
    if (value.isEmpty) return 'Please enter a new password';
    if (!value.contains(RegExp(r'[a-z]'))) {
      return "Password should contain at least 1 lower case letter";
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return "Password should contain at least 1 upper case letter";
    }
    if (!value.contains(RegExp(r'[!@#$&*~]'))) {
      return "Password should contain at least 1 special character";
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return "Password should contain at least 1 number";
    }
    if (value.length <= 8) {
      return "Password should contain at least 8 character";
    }
    return null;
  }
}


