import 'package:flutter_playground_0/core/logger/logger.dart';
import 'package:flutter_playground_0/features/task/data/model/task_model.dart';
import 'package:flutter_playground_0/features/task/data/service/task_service.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class TaskRepository {
  Future<Either<String, List<TaskModel>>> getTasks();
  Future<Either<String, List<TaskModel>>> createTask({required TaskModel task});
  Future<Either<String, List<TaskModel>>> updateTask({required TaskModel task});
  Future<Either<String, List<TaskModel>>> deleteTask({required String id});
}

class TaskRepositoryImpl extends TaskRepository {
  TaskRepositoryImpl({required TaskService taskService})
      : _taskService = taskService;

  final TaskService _taskService;

  @override
  Future<Either<String, List<TaskModel>>> createTask(
      {required TaskModel task}) async {
    try {
      final listMap = await _taskService.createTask(task: task);
      MyLogger.instance.d(listMap);
      return Right(listMap.map((map) => TaskModel.fromMap(map: map)).toList());
    } catch (error) {
      MyLogger.instance.e(error.toString());
      return Left(
          'Ocorreu um erro ao adicionar a nova tarefa! Tente novamente.');
    }
  }

  @override
  Future<Either<String, List<TaskModel>>> deleteTask(
      {required String id}) async {
    try {
      final listMap = await _taskService.deleteTask(id: id);
      MyLogger.instance.d(listMap);
      return Right(listMap.map((map) => TaskModel.fromMap(map: map)).toList());
    } catch (error) {
      MyLogger.instance.e(error.toString());
      return Left('Ocorreu um erro ao excluir a tarefa! Tente novamente.');
    }
  }

  @override
  Future<Either<String, List<TaskModel>>> getTasks() async {
    try {
      final listMap = await _taskService.getTasks();
      MyLogger.instance.d(listMap);
      return Right(listMap.map((map) => TaskModel.fromMap(map: map)).toList());
    } catch (error) {
      MyLogger.instance.e(error.toString());
      return Left('Ocorreu um erro ao buscar as tarefas! Tente novamente.');
    }
  }

  @override
  Future<Either<String, List<TaskModel>>> updateTask(
      {required TaskModel task}) async {
    try {
      final listMap = await _taskService.updateTask(task: task);
      MyLogger.instance.d(listMap);
      return Right(listMap.map((map) => TaskModel.fromMap(map: map)).toList());
    } catch (error) {
      MyLogger.instance.e(error.toString());
      return Left('Ocorreu um erro ao atualizar a tarefa! Tente novamente.');
    }
  }
}
