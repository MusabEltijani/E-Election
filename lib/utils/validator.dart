class UtilValidators {
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );
  static final RegExp _passwordRegExp = RegExp(
    r'^.{4,10}$',
  );

  static final RegExp _phoneNumberRegExp = RegExp(r'^\+?[0-9].{7,16}$');

  static final RegExp _cardNumberRegExp = RegExp(r'^[0-9].{5,10}$');
  //RegExp(r'^\+?[1-9][0-9].{7,14}$');

  static final RegExp _otpCodeRegExp = RegExp(r'^[0-9].{3,10}$');

  static isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  static isValidPhoneNumber(String phoneNumber) {
    return _phoneNumberRegExp.hasMatch(phoneNumber);
  }

  static isValidCardNumber(String cardNumber) {
    return _cardNumberRegExp.hasMatch(cardNumber);
  }

  static isValidOtpCode(String otpCode) {
    return _otpCodeRegExp.hasMatch(otpCode);
  }

  static isValidPassword(String password) {
    return password.isNotEmpty && password.length >= 4;
  }

  static isValidName(String name) {
    return name.isNotEmpty && name.length > 4;
  }

  static isValidText(String? text) {
    if (text == null) {
      return false;
    } else {
      return text.isNotEmpty;
    }
  }

  static isPlatNumber(String? text) {
    if (text == null) {
      return false;
    } else {
      return text.isNotEmpty && text.length > 3;
    }
  }

  ///Singleton factory
  static final UtilValidators _instance = UtilValidators._internal();

  factory UtilValidators() {
    return _instance;
  }

  UtilValidators._internal();
}
