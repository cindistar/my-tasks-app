part of 'task_bloc.dart';

@immutable
abstract class TaskEvent {}

class TaskAddedEvent extends TaskEvent {
  final TaskModel task;

  TaskAddedEvent({required this.task});
}

class TaskRemovedEvent extends TaskEvent {
  final TaskModel task;

  TaskRemovedEvent({required this.task});
}
