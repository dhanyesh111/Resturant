      import 'package:intl/intl.dart';

extension StringExtension on String? {
  String changeDateFormat({String? fromFormat, String? toFormat}) =>
      this == null
          ? ""
          : DateFormat(toFormat ?? "yyyy-MM-dd")
              .format(DateFormat(fromFormat ?? "dd / MMM / yyyy").parse(this!));
  DateTime changeToDate({String? fromFormat}) =>
      DateFormat(fromFormat ?? "dd / MMM / yyyy").parse(this!);
}

extension DateTimeExtensions on DateTime {
  String changeDateFormat({String? format}) =>
      DateFormat(format ?? "yyyy-MM-dd").format(this);
}

      
