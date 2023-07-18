class EventEntity {
  final String title;
  final String description;
  final String imagePath;
  final DateTime dateFrom;
  final DateTime dateTo;
  final List<String> tags;
  EventEntity({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.dateFrom,
    required this.dateTo,
    required this.tags,
  });
}
