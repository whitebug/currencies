/// Timer utils
class VerificationUtils {
  /// Password format
  static const String passwordRegexp =
      r'''^(?=.*[a-zа-я])(?=.*[A-ZА-Я])(?=.*\d)[A-Za-zА-Яа-я\d~!?@#$%^&*()_\-\+{}\[\]><\/\\|.:,;'"]{8,128}$''';

  /// Phone format
  static const String phoneRegexp = r'^(8|\+7)[(\- ]?(\d[\- ()]*){10}$';

  /// Name format
  static const String nameRegexp =
      r'''^(?=.*[A-ZА-Я])[A-Za-zА-Яа-я\-\s]{1,200}$''';

  /// Email format
  static const String emailRegexp =
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$';

  /// Format timer
  static String formatTimer(int duration) {
    final minutes = duration ~/ 60;
    final seconds = duration % 60;
    return '${minutes.toString().padLeft(2, '0')}:'
        '${seconds.toString().padLeft(2, '0')}';
  }

  /// Phone number without additional symbols
  static String phoneWithoutExtraSymbols(String phoneNumber) {
    return phoneNumber.replaceAll(RegExp(r'\s+|\(|\)'), '');
  }

  /// Check if password is correct
  static bool checkPassword(String password) {
    final passwordExp = RegExp(passwordRegexp);
    return passwordExp.hasMatch(password);
  }

  /// Check phone format
  static bool checkPhoneFormat({required String phoneNumber}) {
    final cleanPhone = phoneWithoutExtraSymbols(phoneNumber);
    final phoneExp = RegExp(phoneRegexp);
    return phoneExp.hasMatch(cleanPhone);
  }

  /// Check user name format
  static bool checkUserNameFormat({required String name}) {
    final nameExp = RegExp(nameRegexp);
    return nameExp.hasMatch(name);
  }

  /// Check email format
  static bool checkEmailFormat({required String email}) {
    final nameExp = RegExp(emailRegexp);
    return nameExp.hasMatch(email);
  }
}
