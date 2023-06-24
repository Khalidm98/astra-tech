abstract class Validators {
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Enter the email address';
    if (!RegExp(r"^[a-zA-Z0-9._]+@[a-zA-Z0-9-]+\.[a-zA-Z]+").hasMatch(value))
      return 'Enter a valid email address';
    return null;
  }

  static String? passExtra(String? value) {
    if (value == null || value.isEmpty) return 'Enter the password';
    if (value.length < 8) return 'Password must contain at least 8 characters';
    if (int.tryParse(value) != null)
      return "Password can't be entirely numeric";
    return null;
  }
}
