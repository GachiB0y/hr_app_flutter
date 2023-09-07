import 'package:flutter/services.dart';

class InternationalPhoneFormatter extends TextInputFormatter {
  String internationalPhoneFormat(String text) {
    //регулярка протиа букв. в телефоне только цифры
    text = text.replaceAll(RegExp(r'\D'), '');
    if (text.isNotEmpty) {
      String phone = '';
      //проверяем российски ли номер
      if (['7', '8', '9'].contains(text[0])) {
        //если пользователь начал с 9, то добавим 7
        if (text[0] == '9') {
          text = '7$text';
        }
        //Проверяем нужен ли +
        String firstSymbols = (text[0] == '8') ? '8' : '+7';
        //само форматирование
        phone = '$firstSymbols ';
        if (text.length > 1) {
          phone += '(${text.substring(1, (text.length < 4) ? text.length : 4)}';
        }
        if (text.length >= 5) {
          phone +=
              ') ${text.substring(4, (text.length < 7) ? text.length : 7)}';
        }
        if (text.length >= 8) {
          phone += '-${text.substring(7, (text.length < 9) ? text.length : 9)}';
        }
        if (text.length >= 10) {
          phone +=
              '-${text.substring(9, (text.length < 11) ? text.length : 11)}';
        }
        return phone;
      } else {
        return '+$text';
      }
    }
    return '';
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    return newValue.copyWith(
        text: internationalPhoneFormat(text),
        selection: TextSelection.collapsed(
            offset: internationalPhoneFormat(text).length));
  }
}
