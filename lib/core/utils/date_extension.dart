// ignore_for_file: no_leading_underscores_for_local_identifiers

extension DateExtension on DateTime {
  String toDate() {
    String _month = month >= 10 ? month.toString() : '0$month';

    String _day = day >= 10 ? day.toString() : '0$day';

    return '$year-$_month-$_day';
  }
}
