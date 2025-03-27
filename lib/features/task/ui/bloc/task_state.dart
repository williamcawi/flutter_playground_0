import 'package:equatable/equatable.dart';

import '../../data/model/task_model.dart';

sealed class TaskState extends Equatable {
  final List<TaskModel> listTasks;

  const TaskState({this.listTasks = const []});

  @override
  List<Object?> get props => [List.unmodifiable(listTasks)];
}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {
  const TaskLoading({required super.listTasks});
}

class TaskSuccess extends TaskState {
  const TaskSuccess({required super.listTasks});
}

class TaskError extends TaskState {
  final String message;

  const TaskError({required this.message});

  @override
  List<Object?> get props => [message];
}
