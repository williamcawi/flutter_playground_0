import 'package:bloc/bloc.dart';
import 'package:flutter_playground_0/features/task/data/repository/task_repository.dart';
import 'package:flutter_playground_0/features/task/ui/bloc/task_event.dart';
import 'package:flutter_playground_0/features/task/ui/bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;

  TaskBloc({required TaskRepository taskRepository})
      : _taskRepository = taskRepository,
        super(TaskInitial()) {
    //Get event
    on<GetTasksEvent>(
      (event, emit) async {
        emit(TaskLoading(listTasks: state.listTasks));
        final result = await _taskRepository.getTasks();
        result.fold((message) {
          emit(TaskError(message: message));
        }, (listTasks) {
          emit(TaskSuccess(listTasks: listTasks));
        });
      },
    );

    //Create Event
    on<CreateTaskEvent>(
      (event, emit) async {
        emit(TaskLoading(listTasks: state.listTasks));
        final result = await _taskRepository.createTask(task: event.task);
        result.fold((message) {
          emit(TaskError(message: message));
        }, (listTasks) {
          emit(TaskSuccess(listTasks: listTasks));
        });
      },
    );

    //Update Event
    on<UpdateTaskEvent>(
      (event, emit) async {
        emit(TaskLoading(listTasks: state.listTasks));
        final result = await _taskRepository.updateTask(task: event.task);
        result.fold((message) {
          emit(TaskError(message: message));
        }, (listTasks) {
          emit(TaskSuccess(listTasks: listTasks));
        });
      },
    );

    //Delete Event
    on<DeleteTaskEvent>(
      (event, emit) async {
        emit(TaskLoading(listTasks: state.listTasks));
        final result = await _taskRepository.deleteTask(id: event.id);
        result.fold((message) {
          emit(TaskError(message: message));
        }, (listTasks) {
          emit(TaskSuccess(listTasks: listTasks));
        });
      },
    );
  }
}
