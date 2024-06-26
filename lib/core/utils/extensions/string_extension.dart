/// Расширения [String]
extension StringExtensions on String {

  /// Удаляет все символы, кроме чисел.
  String toOnlyNum() {
    return toString().replaceAll(RegExp(r"\D+"), '');
  }

  DateTime convertToDateTime() {
    List<String> parts = split('-');
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);

    return DateTime(year, month, day);
  }
}