import 'dart:async';
import 'dart:ffi';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/bloc/task_event.dart';
import 'package:task/data/bloc/task_states.dart';
import 'package:task/data/model/taskModel.dart';
import 'package:uuid/uuid.dart';

class TaskBloc extends Bloc<TaskEvent, TaskStateBloc> {
  TaskBloc() : super(TaskStateInitial()) {
    on<AddTaskEvent>(_addTask);
    on<RemoveTaskEvent>(_removeTask);
    on<ToggleTaskEvent>(_toggleTask);
  }

  FutureOr<void> _removeTask(
      RemoveTaskEvent event, Emitter<TaskStateBloc> emit) {
    final List<TaskModel> newList =
        state.list.where((task) => task.id != event.id).toList();
    emit(TaskUpdateBloc(newList));
  }

  FutureOr<void> _addTask(AddTaskEvent event, Emitter<TaskStateBloc> emit) {
    final model = TaskModel(
      id: Uuid().v1(),
      title: event.title,
      isCompleted: false,
    );
    emit(TaskUpdateBloc([...state.list, model]));
  }

  FutureOr<void> _toggleTask(
      ToggleTaskEvent event, Emitter<TaskStateBloc> emit) {
    final List<TaskModel> newList = state.list.map((task) {
      return task.id == event.id
          ? task.coptWith(isCompleted: !task.isCompleted)
          : task;
    }).toList();
    emit(TaskUpdateBloc(newList));
  }
}

//
// addTask(String taskName) {
//   final model = TaskModel(
//     id: Uuid().v1(),
//     title: taskName,
//     isCompleted: false,
//   );
  // emit(UpdateTaskState([...state.taskList, model]));
// }

// deleteTask(String id) {
//   final List<TaskModel> newList =
//       state.taskList.where((task) => task.id != id).toList();
//   emit(UpdateTaskState(newList));
// }

// toggleTask(String id) {
  // final List<TaskModel> newList = state.taskList.map((task) {
  //   return task.id == id ? task.coptWith(isCompleted: !task.isCompleted) : task;
  // }).toList();
  // emit(UpdateTaskState(newList));
// }
