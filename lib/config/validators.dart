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
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (phone == null || phone.isEmpty) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(phone)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String? validateName(String? name) =>
    name == null || name.isEmpty ? 'Please Enter A Name' : null;
