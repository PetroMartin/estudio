class FormValidator {
  static String? validateLink(String? value) {
    String urlPatttern = r'^(https?:\/\/)?' // Optional protocol
        r'((([a-zA-Z0-9$-_@.&+!*"(),]|(%[0-9a-fA-F]{2}))+\.)+[a-zA-Z]{2,6}|' // Domain name
        r'(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})|' // OR IPv4 address
        r'(\[?[a-fA-F0-9:]+\]?)|localhost)' // OR IPv6 address or localhost
        r'(:\d+)?' // Optional port
        r'(\/[-a-zA-Z0-9$-_@.&+!*"(),=%]*)*' // Path
        r'(\?[;&a-zA-Z0-9$-_@.&+!*"(),=%]*)?' // Query string
        r'(#[-a-zA-Z0-9$-_@.&+!*"(),=%]*)?$'; // Fragment

    RegExp regExp = RegExp(urlPatttern);

    if (value!.isEmpty) {
      return 'Please enter the product link';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid product link';
    }

    return null;
  }

  static String? validateProductName(String? value) {
    return value!.isEmpty ? 'Please enter the product name' : null;
  }

  static String? validatePhoneNumber(String? value) {
    RegExp regExp = RegExp(
      r'^(\+\d{1,3})?[ -]?(\d[ -]?){8,12}$',
    );

    if (value == null || value.isEmpty) {
      return 'Please enter a phone number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid phone number';
    }

    return null;
  }

  static String? validateProductDescription(String? value) {
    return value!.isEmpty ? 'Please enter the product description' : null;
  }

  static String? validateProductQuantity(String? value) {
    return value!.isEmpty ? 'Please enter product quantity' : null;
  }

  //Authentication
  static String? validateEmail(String? value) {
    String emailPattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(emailPattern);

    if (value!.isEmpty) {
      return 'Please enter your email address';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    int numericCount = value.replaceAll(RegExp(r'[^0-9]'), '').length;
    if (numericCount < 2) {
      return 'Password must contain at least 2 numeric characters';
    }

    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least 1 special character';
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least 1 uppercase letter';
    }

    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least 1 lowercase letter';
    }

    return null;
  }

  static String? validateFullName(String? value) {
    return value!.isEmpty ? 'Please enter your fullname' : null;
  }

  //validatePasswordConfirmation
  static String? validatePasswordConfirmation(String? value, String password) {
    if (value!.isEmpty) {
      return 'Please enter your password confirmation';
    } else if (value != password) {
      return 'Password confirmation does not match';
    }
    return null;
  }
}
