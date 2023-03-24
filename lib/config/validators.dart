/// Email Validator
String? validateEmail(String? email) => email == null
    ? 'Please Enter an Email'
    : RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(email) ==
            true
        ? null
        : 'Invalid Email';

/// Phone Number Validator
String? validateMobile(String? phone) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,14}$)';
  RegExp regExp = RegExp(pattern);
  if (phone == null || phone.isEmpty) {
    return 'Please Enter Phone Number';
  } else if (!regExp.hasMatch(phone)) {
    return 'Please Enter Valid Phone Number';
  }
  return null;
}

String? validateOTP(String? otp) {
  String pattern = r'^[0-9]{6,6}$';
  RegExp regExp = RegExp(pattern);
  if (otp == null || otp.isEmpty) {
    return 'Please Enter OTP';
  } else if (!regExp.hasMatch(otp)) {
    return 'Please Enter Full OTP';
  }
  return null;
}

String? validateName(String? name) => name == null || name.isEmpty
    ? 'Please Enter A Name'
    : (name.length < 4)
        ? 'Please Enter Your Full Name'
        : null;
