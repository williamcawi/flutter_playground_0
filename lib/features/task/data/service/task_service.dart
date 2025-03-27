import 'package:flutter_playground_0/features/task/data/model/task_model.dart';

abstract interface class TaskService {
  Future<List<Map<String, dynamic>>> getTasks();

  Future<List<Map<String, dynamic>>> createTasks({required TaskModel task});

  Future<List<Map<String, dynamic>>> updateTasks({required TaskModel task});

  Future<List<Map<String, dynamic>>> deleteTasks({required String id});
}

class TaskServiceImpl extends TaskService {
  @override
  Future<List<Map<String, dynamic>>> createTasks({required TaskModel task}) {
    // TODO: implement createTasks
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> deleteTasks({required String id}) {
    // TODO: implement deleteTasks
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> getTasks() {
    // TODO: implement getTasks
    throw UnimplementedError();
  }

  @override
  Future<List<Map<String, dynamic>>> updateTasks({required TaskModel task}) {
    // TODO: implement updateTasks
    throw UnimplementedError();
  }
}