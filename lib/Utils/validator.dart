class validator {
  // validate email function
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Email cannot be null";
    }
    return null;
  }
  //validate password function

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Kindly input password";
    }
    return null;
  }
  //validate Confirm password

  static String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Enter Confirm Password";
    }
    return null;
  }
}
