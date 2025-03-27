import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/cubit/task_states.dart';
import 'package:task/data/model/taskModel.dart';
import 'package:uuid/uuid.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskInitialState());

  //! Have Three Functions

  addTask(String taskName) {
    final model = TaskModel(
      id: Uuid().v1(),
      title: taskName,
      isCompleted: false,
    );
    emit(UpdateTaskState([...state.taskList, model]));
  }

  deleteTask(String id) {
    final List<TaskModel> newList =
        state.taskList.where((task) => task.id != id).toList();
    emit(UpdateTaskState(newList));
  }

  toggleTask(String id) {
    final List<TaskModel> newList = state.taskList.map((task) {
      return task.id == id
          ? task.coptWith(isCompleted: !task.isCompleted)
          : task;
    }).toList();
    emit(UpdateTaskState(newList));
  }
}
