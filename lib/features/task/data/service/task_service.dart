import 'package:flutter_playground_0/features/task/data/model/task_model.dart';

abstract interface class TaskService {
  Future<List<Map<String, dynamic>>> getTasks();

  Future<List<Map<String, dynamic>>> createTask({required TaskModel task});

  Future<List<Map<String, dynamic>>> updateTask({required TaskModel task});

  Future<List<Map<String, dynamic>>> deleteTask({required String id});
}

class TaskServiceImpl extends TaskService {
  List<Map<String, dynamic>> listMap = [];

  @override
  Future<List<Map<String, dynamic>>> createTask({required TaskModel task}) {
    listMap.add(task.toMap());
    return Future.value(listMap);
  }

  @override
  Future<List<Map<String, dynamic>>> deleteTask({required String id}) {
    listMap.removeWhere((t) => t['id'] == id);
    return Future.value(listMap);
  }

  @override
  Future<List<Map<String, dynamic>>> getTasks() {
    return Future.value(listMap);
  }

  @override
  Future<List<Map<String, dynamic>>> updateTask({required TaskModel task}) {
    final index = listMap.indexWhere((t) => t['id'] == task.id);
    listMap[index] = task.toMap();
    return Future.value(listMap);
  }
}
