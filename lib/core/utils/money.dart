import 'dart:math' as math;
import 'package:kunke_naturals_admin_app/config/constants.dart';
import 'package:intl/intl.dart';

class MoneyEntity {
  final NumberFormat _formatter;
  final CurrencyDatum _currency;

  MoneyEntity._(CurrencyDatum currency)
      : _currency = currency,
        _formatter = NumberFormat.currency(
          name: currency.name,
          symbol: "${currency.shortName} ",
          locale: currency.locale,
          decimalDigits: currency.minorUnits,
        );

  factory MoneyEntity([CurrencyDatum? currency]) {
    return MoneyEntity._(currency ?? ngn);
  }

  /// returns a moneyEntity instance without currency shortName/symbol
  MoneyEntity normalized() => MoneyEntity(_currency.copyWith(shortName: ""));

  int get scaleFactor => math.pow(10, _currency.minorUnits).round();

  /// use this to to get the integral value of a monetary input
  /// Eg usd $1.24 becomes 124 cents
  int getValue(num input) => (input * scaleFactor).round();
  String formatValue(num input) => _formatter.format(input / scaleFactor);

  num sanitizeAmount(String? value) {
    if (value == null) return 0;
    try {
      value =
          value.replaceAll(RegExp(r"[A-Za-b]+"), "").replaceAll(",", "").trim();
      final sanitizedAmount = getValue(double.parse(value));
      return sanitizedAmount;
    } catch (_) {
      return 0;
    }
  }
}

class CurrencyDatum {
  final String name;
  final String shortName;
  final String locale;
  final int minorUnits;
  final String flag;
  const CurrencyDatum({
    required this.name,
    required this.shortName,
    required this.locale,
    required this.minorUnits,
    required this.flag,
  });

  CurrencyDatum copyWith({
    String? name,
    String? shortName,
    String? locale,
    int? minorUnits,
    String? flag,
  }) {
    return CurrencyDatum(
      name: name ?? this.name,
      shortName: shortName ?? this.shortName,
      locale: locale ?? this.locale,
      minorUnits: minorUnits ?? this.minorUnits,
      flag: flag ?? this.flag,
    );
  }
}

const ngn = CurrencyDatum(
  name: "naira",
  shortName: "NGN",
  locale: "en_NG",
  minorUnits: 2,
  flag: ImgAssets.NIGERIA_FLAG,
);

List<CurrencyDatum> supportedCurrencyList() => [ngn];
