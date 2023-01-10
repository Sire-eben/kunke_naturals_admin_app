import 'package:flutter/foundation.dart';
import "package:intl/intl.dart";
import 'package:uuid/uuid.dart';

String getRandomReferenceId() => const Uuid().v4();

String getTimestamp() => DateTime.now().toIso8601String();

DateFormat longDateFormat() => DateFormat.yMMMMd();

void runIfNotNull<T>(T? value, ValueChanged<T> func) {
  if (value != null) {
    func(value);
  }
}
