// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// class EventEntity {
//   final String title;
//   final String description;
//   final String imagePath;
//   final String? base64Image;
//   final DateTime dateFrom;
//   final DateTime dateTo;
//   final List<String> tags;
//   EventEntity({
//     required this.title,
//     required this.description,
//     required this.imagePath,
//     required this.base64Image,
//     required this.dateFrom,
//     required this.dateTo,
//     required this.tags,
//   });

//   EventEntity copyWith({
//     String? title,
//     String? description,
//     String? imagePath,
//     String? base64Image,
//     DateTime? dateFrom,
//     DateTime? dateTo,
//     List<String>? tags,
//   }) {
//     return EventEntity(
//       title: title ?? this.title,
//       description: description ?? this.description,
//       imagePath: imagePath ?? this.imagePath,
//       base64Image: base64Image ?? this.base64Image,
//       dateFrom: dateFrom ?? this.dateFrom,
//       dateTo: dateTo ?? this.dateTo,
//       tags: tags ?? this.tags,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'title': title,
//       'description': description,
//       'imagePath': imagePath,
//       'base64Image': base64Image,
//       'dateFrom': dateFrom.millisecondsSinceEpoch,
//       'dateTo': dateTo.millisecondsSinceEpoch,
//       'tags': tags,
//     };
//   }

//   factory EventEntity.fromMap(Map<String, dynamic> map) {
//     return EventEntity(
//         title: map['title'] as String,
//         description: map['description'] as String,
//         imagePath: map['imagePath'] as String,
//         base64Image:
//             map['base64Image'] != null ? map['base64Image'] as String : null,
//         dateFrom: DateTime.fromMillisecondsSinceEpoch(map['dateFrom'] as int),
//         dateTo: DateTime.fromMillisecondsSinceEpoch(map['dateTo'] as int),
//         tags: List<String>.from(
//           (map['tags'] as List<String>),
//         ));
//   }

//   String toJson() => json.encode(toMap());

//   factory EventEntity.fromJson(String source) =>
//       EventEntity.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'EventEntity(title: $title, description: $description, imagePath: $imagePath, base64Image: $base64Image, dateFrom: $dateFrom, dateTo: $dateTo, tags: $tags)';
//   }

//   @override
//   bool operator ==(covariant EventEntity other) {
//     if (identical(this, other)) return true;

//     return other.title == title &&
//         other.description == description &&
//         other.imagePath == imagePath &&
//         other.base64Image == base64Image &&
//         other.dateFrom == dateFrom &&
//         other.dateTo == dateTo &&
//         listEquals(other.tags, tags);
//   }

//   @override
//   int get hashCode {
//     return title.hashCode ^
//         description.hashCode ^
//         imagePath.hashCode ^
//         base64Image.hashCode ^
//         dateFrom.hashCode ^
//         dateTo.hashCode ^
//         tags.hashCode;
//   }
// }
