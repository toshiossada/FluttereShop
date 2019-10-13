class CustomValidators {
  static isEmail(String value) {
    RegExp regex =
        new RegExp(r"^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$");
    if (!regex.hasMatch(value)) return 'E-mail inválido';
    if (value.isEmpty) {
      return 'E-mail inválido';
    }
    return null;
  }
}
