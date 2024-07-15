import 'package:flutter/services.dart';

class InternationalPhoneFormatter extends TextInputFormatter {
  String internationalPhoneFormat(String text) {
    //регулярка протиа букв. в телефоне только цифры
    var newText = text.replaceAll(RegExp(r'\D'), '');
    if (newText.isNotEmpty) {
      var phone = '';
      //проверяем российски ли номер
      if (['7', '8', '9'].contains(newText[0])) {
        //если пользователь начал с 9, то добавим 7
        if (newText[0] == '9') {
          newText = '7$newText';
        }
        //Проверяем нужен ли +
        final firstSymbols = (newText[0] == '8') ? '8' : '+7';
        //само форматирование
        phone = '$firstSymbols ';
        if (newText.length > 1) {
          phone +=
              '(${newText.substring(1, (newText.length < 4) ? newText.length : 4)}';
        }
        if (newText.length >= 5) {
          phone +=
              ') ${newText.substring(4, (newText.length < 7) ? newText.length : 7)}';
        }
        if (newText.length >= 8) {
          phone +=
              '-${newText.substring(7, (newText.length < 9) ? newText.length : 9)}';
        }
        if (newText.length >= 10) {
          phone +=
              '-${newText.substring(9, (newText.length < 11) ? newText.length : 11)}';
        }
        return phone;
      } else {
        return '+$newText';
      }
    }
    return '';
  }

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    return newValue.copyWith(
      text: internationalPhoneFormat(text),
      selection: TextSelection.collapsed(
        offset: internationalPhoneFormat(text).length,
      ),
    );
  }
}

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length == 14) {
      return oldValue;
    }
    if (oldValue.text.length >= newValue.text.length) {
      return newValue;
    }

    var newText = newValue.text.replaceAll(RegExp('[^0-9]'), '');

    if (newText.length >= 3) {
      newText =
          newText.replaceRange(3, newText.length, ' ${newText.substring(3)}');
    }

    if (newText.length >= 7) {
      newText =
          newText.replaceRange(7, newText.length, '-${newText.substring(7)}');
    }

    if (newText.length >= 10) {
      newText =
          newText.replaceRange(10, newText.length, '-${newText.substring(10)}');
    }

    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
