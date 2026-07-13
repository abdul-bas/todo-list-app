

class TaskModel {
  final String id;
  final String title;
  final String description;
  final String dueDate;
  final bool isCompleted;
  TaskModel({
    required this.id,
    required this.isCompleted,
    required this.description,
    required this.dueDate,
    required this.title,
  });
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'isCompleted': isCompleted,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map["id"] ?? '',
      isCompleted: map["isCompleted"] ??false,
      description: map["description"] ?? '',
      dueDate: map["dueDate"]??'',
      title: map["title"] ?? '',
    );
  }
  TaskModel copyWith({
  String? id,
  String? title,
  String? description,
  String? dueDate,
  bool? isCompleted,
}) {
  return TaskModel(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    dueDate: dueDate ?? this.dueDate,
    isCompleted: isCompleted ?? this.isCompleted,
  );
}
}
