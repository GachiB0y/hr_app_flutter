import 'package:intl/intl.dart' as int;

String formatDateTimeRange({required DateTime start, required DateTime? end}) {
  if (end == null) {
    final formatter = int.DateFormat('dd MMMM HH:mm ', 'ru');
    final startString = formatter.format(start);
    return startString;
  } else {
    final formatter = int.DateFormat('dd MMMM', 'ru');
    final startString = formatter.format(start);
    final endString = formatter.format(end);
    return '$startString - $endString';
  }
}
