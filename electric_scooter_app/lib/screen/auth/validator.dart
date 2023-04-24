class Validator {
  static String? validateFullName({required String? fullname}) {
    if (fullname == null || fullname.isEmpty) {
      return 'Name cannot be empty!';
    } else if (!RegExp(r'^[A-Z][a-z]*([ ][A-Z][a-z]*)*$').hasMatch(fullname)) {
      return 'Name must start with a capital letter and only contain letters!';
    }
    return null;
  }

  static String? validateEmail({required String? email}) {
    if (email == null || email.isEmpty) {
      return 'Email can\'t be empty';
    }
    return null;
  }

  static String? validatePhone({required String? phone}) {
    if (phone == null || phone.isEmpty) {
      return 'Phone can\'t be empty';
    } else if (!RegExp(r'^0[0-9]{7,14}$').hasMatch(phone)) {
      return 'Phone number must consist of 8-15 digits and start with 0!';
    }
    return null;
  }

  static String? validateAddress({required String? address}) {
    if (address == null || address.isEmpty) {
      return 'Address can\'t be empty';
    }
    return null;
  }

  static String? validatePassword({required String? password}) {
    if (password == null || password.isEmpty) {
      return 'Password can\'t be empty';
    } else if (password.length < 6) {
      return 'Enter a password with length at least 6';
    }
    return null;
  }
}
