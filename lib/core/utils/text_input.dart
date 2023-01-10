import 'package:kunke_naturals_admin_app/config/constants.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/string.dart';
import "package:flutter/services.dart";

import 'money.dart';

class PhoneNumber {
  final String number;
  final String dialCode;

  const PhoneNumber({
    required this.number,
    required this.dialCode,
  });
}

class PhoneNumberCountry {
  final String name;
  final String shortName;
  final String countryCode;
  final String flag;
  final int maxLength;

  const PhoneNumberCountry({
    required this.name,
    required this.shortName,
    required this.countryCode,
    required this.flag,
    required this.maxLength,
  });
}

List<PhoneNumberCountry> phoneNumberCountryList() => const [
      PhoneNumberCountry(
        name: "Nigeria",
        shortName: "NG",
        countryCode: "+234",
        flag: ImgAssets.NIGERIA_FLAG,
        maxLength: 11,
      ),
    ];

class AmountInputFormatter extends TextInputFormatter {
  final MoneyEntity moneyEntity;
  AmountInputFormatter(this.moneyEntity);

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) return TextEditingValue.empty;
    final double valueAsDouble = newValue.text.toDouble();
    final string = moneyEntity.formatValue(valueAsDouble);
    return TextEditingValue(
      text: string,
      selection: TextSelection.collapsed(offset: string.length),
    );
  }
}

class DatePatternInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    final buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      final nonZeroIndex = i + 1;
      if ((nonZeroIndex == 2 || nonZeroIndex == 4) &&
          nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    final string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
