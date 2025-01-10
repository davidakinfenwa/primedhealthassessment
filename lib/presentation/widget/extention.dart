// Extensions for String
extension StringExtensions on String {
  // Check if String is a valid email
  bool isValidEmail() {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }
 
   
}