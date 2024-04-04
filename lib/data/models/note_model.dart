import 'dart:math';
import 'dart:ui';

class NoteModel {
  final int? id;
  final String noteText;
  final DateTime createdDate;
  final int noteColor;

  NoteModel( {
    this.id,
    required this.noteText,
    required this.createdDate,
    required this.noteColor,
  });
  NoteModel copyWith({
    int? id,
    String? noteText,
    DateTime? createdDate,
    int? noteColor,
  }) {
    return NoteModel(
      id: id,
      noteText: noteText ?? this.noteText,
      createdDate: createdDate ?? this.createdDate,
      noteColor: noteColor ?? this.noteColor,
    );
  }

  factory NoteModel.fromJson(Map<String, dynamic> json) {
    return NoteModel(
      id:json["id"]as int? ?? 0,
      noteText: json['noteText'] as String? ?? "",
      createdDate: DateTime.parse(json['createdDate'] as String? ?? ""),
      noteColor: json['noteColor'] as int? ?? 0,
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'noteText': noteText,
      'createdDate': createdDate.toIso8601String(),
      'noteColor': noteColor,
    };
  }
  factory NoteModel.randomColor({
    required String noteText,
    required DateTime createdDate,
  }) {
    final Random random = Random();
    final int color = Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    ).value;

    return NoteModel(
      id: 0,
      noteText: noteText,
      createdDate: createdDate,
      noteColor: color,
    );
  }
}
