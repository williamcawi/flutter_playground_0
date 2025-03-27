import 'package:equatable/equatable.dart';
import 'package:flutter_playground_0/features/task/data/model/task_model.dart';

sealed class TaskEvent extends Equatable {}

class GetTasksEvent extends TaskEvent {
  @override
  List<Object?> get props => [];
}

class CreateTaskEvent extends TaskEvent {
  CreateTaskEvent({required this.task});

  final TaskModel task;

  @override
  List<Object?> get props => [task];
}

class UpdateTaskEvent extends TaskEvent {
  final TaskModel task;

  UpdateTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteTaskEvent extends TaskEvent {
  final String id;

  DeleteTaskEvent({required this.id});

  @override
  List<Object?> get props => [id];
}
