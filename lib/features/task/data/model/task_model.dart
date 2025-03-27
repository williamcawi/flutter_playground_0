import 'dart:convert';

class TaskModel {
  TaskModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.isDone});

  final String id;
  final String title;
  final String description;
  final DateTime date;
  final bool isDone;

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? date,
    bool? isDone,
  }) {
    return TaskModel(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        isDone: isDone ?? this.isDone);
  }

  factory TaskModel.fromMap({required Map<String, dynamic> map}) {
    return TaskModel(
        id: map['id'],
        title: map['title'],
        description: map['description'],
        date: map['date'],
        isDone: map['isDone']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'isDone': isDone,
    };
  }

  String toJson() {
    return '{"id": $id, "title": $title, "description": $description, "date": $date "isDone": $isDone}';
  }

  factory TaskModel.fromJson(String json) {
    final Map<String, dynamic> map = json.isEmpty ? jsonDecode(json) : {};
    return TaskModel.fromMap(map: map);
  }

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, date: $date, isDone: $isDone)';
  }
}
