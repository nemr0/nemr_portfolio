/// Email Validator
String? validateEmail(String? email) {
  if (email == null) {
    return 'Please Enter an Email';
  }

  if (RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  ).hasMatch(email)) return null;

  return 'Invalid Email';
}

/// Phone Number Validator
String? validateMobile(String? phone) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,14}$)';
  RegExp regExp = RegExp(pattern);
  if (phone == null || phone.isEmpty) {
    return 'Please Enter A Phone Number, exp: 201111111111';
  } else if (!regExp.hasMatch(phone)) {
    return 'Please Enter Valid Phone Number, exp: 201111111111';
  }

  return null;
}

// String? validateOTP(String? otp) {
//   String pattern = r'^[0-9]{6,6}$';
//   RegExp regExp = RegExp(pattern);
//   if (otp == null || otp.isEmpty) {
//     return 'Please Enter OTP';
//   } else if (!regExp.hasMatch(otp)) {
//     return 'Please Enter Full OTP';
//   }
//
//   return null;
// }

String? validateName(String? name) {
  if (name == null || name.isEmpty) return 'Please Enter A Name';

  if (name.length < 4) return 'Please Enter Your Full Name';

  return null;
}
