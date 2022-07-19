import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:my_tasks_app/models/task_model.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskState(taskList: const [])) {
    on<TaskAddedEvent>(taskAdded);
    on<TaskRemovedEvent>(taskRemoved);
  }

  void taskAdded(TaskAddedEvent event, Emitter<TaskState> emit) {
    final newTask = List<TaskModel>.from(state.taskList);

    final taskItem = state.taskList.firstWhereOrNull(
      (taskItem) => taskItem.title == event.task.title,
    );

    if (taskItem != null) {
      newTask[newTask.indexOf(taskItem)] = TaskModel(
        title: taskItem.title,
        description: taskItem.description,
        date: taskItem.date,
      );
    } else {
      newTask.add(event.task);
    }
    // final newTask = TaskModel(
    //   title: event.task.title,
    //   description: event.task.description,
    //   date: event.task.date,
    // );

    // final tasks = [...state.taskList, newTask];
    emit(TaskState(taskList: newTask));
  }

  void taskRemoved(TaskRemovedEvent event, Emitter<TaskState> emit) {
    final newTasks = state.taskList.where((TaskModel task) => task.title != event.task.title).toList();
    //final newTask = List<TaskModel>.from(state.taskList);


    emit(TaskState(taskList: newTasks));
  }
}
