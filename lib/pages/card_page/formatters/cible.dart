import 'package:flutter/services.dart';


class CustomStringFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if (i < text.length - 1) {
        buffer.write(' '); // Ajoute un espace après chaque caractère.
      }
    }

    var formattedString = buffer.toString();
    return newValue.copyWith(
      text: formattedString,
      selection: TextSelection.collapsed(offset: formattedString.length),
    );
  }
}
