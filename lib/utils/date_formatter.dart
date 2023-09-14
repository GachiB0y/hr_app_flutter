import 'package:intl/intl.dart' as int;

String formatDateTimeRange({required DateTime start, required DateTime end}) {
  final formatter = int.DateFormat('dd MMMM', 'ru');
  final startString = formatter.format(start);
  final endString = formatter.format(end);
  return '$startString - $endString';
}
