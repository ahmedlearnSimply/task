import 'package:equatable/equatable.dart';

class TaskModel extends Equatable {
  final String title;
  final bool isCompleted;
  final String id;
  const TaskModel({
    required this.title,
    required this.isCompleted,
    required this.id,
  });

  TaskModel coptWith({
    String? title,
    bool? isCompleted,
    String? id,
  }) {
    return TaskModel(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
      id: id ?? this.id,
    );
  }

  @override
  List<Object> get props => [title, isCompleted, id];
}
