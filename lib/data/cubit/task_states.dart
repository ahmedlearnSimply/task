//*states meaning the state of my screen
//* i have three states
//* first one inital state that have an empty list of tasks
//* second one that have function to update the state

// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:equatable/equatable.dart';
import 'package:task/data/model/taskModel.dart';

class TaskState extends Equatable {
  final List<TaskModel> taskList;
  const TaskState(this.taskList);
  @override
  List<Object?> get props => [taskList];
}

class TaskInitialState extends TaskState {
  TaskInitialState() : super([]);
}

class UpdateTaskState extends TaskState {
  UpdateTaskState(super.taskList);
}
