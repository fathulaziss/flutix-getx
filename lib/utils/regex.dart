bool isValidPassword({required String password, int minLength = 6}) {
  if (password.isEmpty) {
    return false;
  }

  // final capitalFirst = password.substring(0, 1).contains(RegExp('[A-Z]'));
  final hasUppercase = password.contains(RegExp('[A-Z]'));
  final hasDigits = password.contains(RegExp('[0-9]'));
  final hasLowercase = password.contains(RegExp('[a-z]'));
  // final hasSpecialCharacters =
  //     password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  final hasMinLength = password.length >= minLength;

  return
      // capitalFirst &&
      hasDigits && hasUppercase && hasLowercase && hasMinLength;
  // &&
  // hasSpecialCharacters;
}

String convertCapitalCase(String text) {
  final newText =
      text.isNotEmpty ? '${text[0].toUpperCase()}${text.substring(1)}' : '';
  // ex : Hello world
  return newText;
}

String convertTitleCase(String text) {
  final newText = text
      .replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map(convertCapitalCase)
      .join(' ');
  // ex : Hello World
  return newText;
}
