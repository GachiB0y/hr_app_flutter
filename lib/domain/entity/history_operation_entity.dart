class HistoryOperationEntity {
  final DateTime date;
  final String name;
  final int count;
  final bool isTransfer;
  HistoryOperationEntity({
    required this.date,
    required this.name,
    required this.count,
    required this.isTransfer,
  }) {}
}
